-- DATA CLEANING PROSES
DROP TABLE IF EXISTS online_retail_clean;

CREATE TABLE online_retail_clean AS
SELECT DISTINCT ON (invoiceno, stockcode, quantity, invoicedate, unitprice, customerid)
       invoiceno,
       stockcode,
       description,
       quantity,
       invoicedate,
       unitprice,
       customerid,
       country
FROM online_retail
WHERE quantity > 0
  AND unitprice > 0
  AND customerid IS NOT NULL
ORDER BY invoiceno, stockcode, quantity, invoicedate, unitprice, customerid;

ALTER TABLE online_retail_clean ADD COLUMN totalsales NUMERIC(14,2);

UPDATE online_retail_clean
SET totalsales = quantity * unitprice;

SELECT invoicedate, pg_typeof(invoicedate) AS tipe_data
FROM online_retail_clean;

SELECT stockcode, description, SUM(totalsales) AS revenue
FROM online_retail_clean
GROUP BY stockcode, description;

DELETE FROM online_retail_clean
WHERE invoiceno LIKE 'C%'; 

UPDATE online_retail_clean
SET description = UPPER(TRIM(BOTH FROM description));

--anomali quantity>1000
SELECT *
FROM online_retail_clean
WHERE quantity > 1000
   OR unitprice > 10000;

DELETE FROM online_retail_clean
WHERE quantity > 1000
OR unitprice > 10000;

DELETE FROM online_retail_clean
WHERE customerid IS NULL
OR country IS NULL
OR TRIM(country) = '';

SELECT DISTINCT country FROM online_retail_clean ORDER BY country;

--EDA
SELECT 
    COUNT(*) AS total_transaksi,
    MIN(invoicedate) AS tanggal_pertama,
    MAX(invoicedate) AS tanggal_terakhir
FROM online_retail_clean;

SELECT 
    country,
    COUNT(DISTINCT invoiceno) AS total_order,
    SUM(totalsales) AS total_revenue
FROM online_retail_clean
GROUP BY country
ORDER BY total_revenue DESC;

--Produk terlaris (berdasarkan quantity)
SELECT 
    stockcode,
    description,
    SUM(quantity) AS total_qty
FROM online_retail_clean
GROUP BY stockcode, description
ORDER BY total_qty DESC
LIMIT 10;

--Produk dengan revenue tertinggi
SELECT 
    stockcode,
    description,
    SUM(totalsales) AS revenue
FROM online_retail_clean
GROUP BY stockcode, description
ORDER BY revenue DESC
LIMIT 10;

--Tren penjualan per bulan
SELECT 
    DATE_TRUNC('month', invoicedate) AS bulan,
    SUM(totalsales) AS revenue
FROM online_retail_clean
GROUP BY DATE_TRUNC('month', invoicedate)
ORDER BY bulan;

--Top customer berdasarkan revenue
SELECT 
    customerid,
    SUM(totalsales) AS revenue,
    COUNT(DISTINCT invoiceno) AS jumlah_order
FROM online_retail_clean
GROUP BY customerid
ORDER BY revenue DESC
LIMIT 10;







