# 🛍 Online Retail II Data Analysis (SQL + Power BI)

## 📌 Deskripsi

Proyek ini menganalisis data transaksi dari perusahaan retail online berbasis UK menggunakan SQL dan PostgreSQL. Fokus utamanya adalah memahami **perilaku pelanggan**, **pola pembelian**, dan **tren penjualan** melalui proses data cleaning, EDA (Exploratory Data Analysis), segmentasi pelanggan berbasis RFM, serta prediksi sederhana penjualan bulanan.

Data divisualisasikan menggunakan **Power BI**, menghasilkan insight yang mudah dipahami dan actionable untuk keputusan bisnis.

## 🎯 Tujuan Proyek

- Membersihkan dan menyiapkan data transaksi retail untuk dianalisis.
- Menganalisis produk populer, negara dengan transaksi terbanyak, dan hubungan antar variabel.
- Melakukan segmentasi pelanggan dengan metode **RFM (Recency, Frequency, Monetary)**.
- Memprediksi tren penjualan berdasarkan data historis.
- Menyajikan hasil analisis dalam bentuk dashboard interaktif.


## 🛠 Tools & Teknologi

- **SQL** (PostgreSQL via pgAdmin)
- **Power BI** (Visualisasi)
- **Git & GitHub** (Version Control)


## 🗂 Dataset

- **Sumber**: [Kaggle - Online Retail II](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci)
- **Jumlah Data**: ±1 juta baris
- **Periode Waktu**: 2009 - 2011
- **Kolom Penting**:
  - `InvoiceNo`, `StockCode`, `Description`
  - `Quantity`, `InvoiceDate`, `UnitPrice`
  - `CustomerID`, `Country`

---

## 🔍 Alur Analisis

### 1️⃣ Data Cleaning (`01_data_cleaning.sql`)
- Menghapus baris dengan `CustomerID` NULL
- Menghapus baris dengan `Quantity <= 0` atau `UnitPrice <= 0`
- Menambahkan kolom `TotalSales = Quantity * UnitPrice`
- Mengubah `InvoiceDate` menjadi format TIMESTAMP

### 2️⃣ Exploratory Data Analysis (`02_eda_analysis.sql`)
- Jumlah transaksi per negara
- Produk paling banyak dibeli
- Korelasi antara Quantity, UnitPrice, dan TotalSales

### 3️⃣ RFM Segmentation (`03_rfm_segmentation.sql`)
- Menghitung **Recency**: hari sejak transaksi terakhir
- Menghitung **Frequency**: jumlah transaksi per pelanggan
- Menghitung **Monetary**: total belanja per pelanggan
- Skoring & segmentasi pelanggan

### 4️⃣ Predictive Trend (`04_predictive_trend.sql`)
- Mengelompokkan penjualan per bulan
- Analisis tren historis untuk estimasi penjualan berikutnya



## 🧱 Schema Star (Visualisasi)

📎 File: [`retail_star_schema.drawio`](./Schema/retail_star_schema.drawio)

![Schema Preview](./Schema/schema_preview.png) <!-- Tambahkan setelah upload -->


## 📸 Dashboard Preview

📎 Lihat lebih lengkap di: [Google Drive (Dashboard & Report)](https://drive.google.com/...)

![Dashboard Screenshot](./Visualizations/dashboard_screenshot.png)


## 📄 Laporan Lengkap

📥 [`Online_Retail_Report.pdf`](./Report/Online_Retail_Report.pdf)

Berisi insight dan rekomendasi bisnis dari hasil analisis.


## 🚀 Eksekusi Proyek

> Semua query SQL bisa dijalankan langsung di **pgAdmin** setelah import dataset ke PostgreSQL.

1. Import dataset CSV ke PostgreSQL.
2. Jalankan script di folder `/SQL`.
3. Bangun visualisasi di Power BI menggunakan data hasil query.


## 📞 Kontak
📮 hawaawalyaghufron@gmail.com  
🔗 [LinkedIn](www.linkedin.com/in/hawa-awalya-ghufron-2a6588321) 



