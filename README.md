# 🛒 Sistem Penjualan Online Sederhana

Program sistem penjualan online berbasis console yang dibuat menggunakan bahasa Pascal/Free Pascal. Program ini menyediakan fitur lengkap untuk manajemen produk dan transaksi penjualan sederhana.

## ✨ Fitur Utama

### 📦 Manajemen Produk
- **Input Produk Baru** - Menambahkan produk dengan nama, harga, dan stok
- **Edit Produk** - Mengubah nama, harga, atau stok produk yang sudah ada
- **Hapus Produk** - Menghapus produk dari daftar dengan konfirmasi
- **Lihat Daftar Produk** - Menampilkan semua produk dalam format tabel yang rapi

### 🛍️ Sistem Belanja
- **Keranjang Belanja** - Menambahkan produk ke keranjang dengan validasi stok
- **Validasi Otomatis** - Mencegah pembelian melebihi stok yang tersedia
- **Invoice Generator** - Menghitung total belanja otomatis dengan ongkos kirim

### 🔧 Fitur Teknis
- **Validasi Input** - Mencegah crash akibat input non-numerik
- **Format Rupiah** - Menampilkan harga dengan pemisah ribuan (Rp 1.500.000)
- **Interface Intuitif** - Menu berbasis console yang mudah digunakan

## 🚀 Cara Menjalankan Program

### Prasyarat
- Free Pascal Compiler (FPC) terinstall
- Windows/Linux/MacOS

### Langkah Instalasi

1. **Clone repository**
   ```bash
   git clone https://github.com/abifadilahs/Toko-Online-Sederhana.git
   cd Toko-Online-Sederhana
   ```

2. **Kompilasi program**
   ```bash
   fpc index.pas
   ```

3. **Jalankan program**
   ```bash
   # Windows
   index.exe
   
   # Linux/MacOS
   ./index
   ```

## 📱 Cara Penggunaan

### Menu Utama
```
==========================================
|   PROGRAM PENJUALAN ONLINE SEDERHANA   |
==========================================
| MENU:                                  |
| 1. Input Data Produk                   |
| 2. Edit Data Produk                    |
| 3. Hapus Data Produk                   |
| 4. Lihat Daftar Produk                 |
| 5. Pilih & Beli Produk                 |
| 6. Lihat Keranjang & Cetak Invoice     |
| 7. Keluar                              |
==========================================
```

### Alur Penggunaan Umum

1. **Input Produk** (Menu 1)
   - Masukkan nama produk
   - Input harga produk
   - Tentukan jumlah stok

2. **Beli Produk** (Menu 5)
   - Pilih produk dari daftar
   - Masukkan jumlah yang ingin dibeli
   - Produk akan ditambahkan ke keranjang

3. **Checkout** (Menu 6)
   - Lihat detail keranjang belanja
   - Input ongkos kirim
   - Cetak invoice final

## 🏗️ Struktur Program

```
├── Type Definitions
│   └── TProduk (nama, harga, stok)
│
├── Utility Functions
│   ├── BacaAngka() - Validasi input numerik
│   ├── FormatRupiah() - Format harga dengan pemisah ribuan
│   └── TampilkanDaftarProduk() - Display produk dalam tabel
│
├── Product Management
│   ├── InputProdukBaru() - Tambah produk baru
│   ├── EditProduk() - Edit data produk
│   └── HapusProduk() - Hapus produk
│
├── Shopping System
│   ├── BeliProduk() - Tambah ke keranjang
│   └── CetakInvoice() - Generate invoice
│
└── Main Program
    ├── TampilkanMenu() - Display menu utama
    └── LihatDaftarProduk() - View daftar produk
```

> 🔍 **Detail implementasi setiap fungsi** dan penjelasan algoritma dapat ditemukan di [TECHNICAL_DOCS.md](TECHNICAL_DOCS.md)

## 🔧 Spesifikasi Teknis

- **Bahasa**: Pascal/Free Pascal
- **Compiler**: Free Pascal Compiler (FPC) 3.2.2+
- **Platform**: Cross-platform (Windows, Linux, MacOS)
- **Dependencies**: `crt`, `sysutils`
- **Kapasitas**: Maksimal 20 produk dan 20 item keranjang
- **Data Type**: 
  - `string[50]` untuk nama produk
  - `longint` untuk harga (mendukung nilai besar)
  - `integer` untuk stok

> 📖 **Untuk dokumentasi teknis lengkap**, lihat [TECHNICAL_DOCS.md](TECHNICAL_DOCS.md) yang menjelaskan detail fungsi, library, algoritma, dan struktur data yang digunakan.

## 📋 Fitur Validasi

### Input Validation
- ✅ Validasi input numerik untuk harga dan stok
- ✅ Mencegah input non-numerik yang menyebabkan crash
- ✅ Validasi rentang untuk nomor produk
- ✅ Konfirmasi sebelum penghapusan data

### Business Logic Validation  
- ✅ Cek stok tersedia sebelum pembelian
- ✅ Validasi kapasitas maksimal produk dan keranjang
- ✅ Otomatis mengurangi stok setelah pembelian
- ✅ Reset keranjang setelah checkout

> 🛡️ **Penjelasan detail error handling** dan strategi validasi tersedia di [TECHNICAL_DOCS.md - Validasi & Error Handling](TECHNICAL_DOCS.md#🔐-validasi--error-handling)

## 🎯 Contoh Output

### Daftar Produk
```
No. | Nama Produk                | Harga          | Stok
----+----------------------------+----------------+------
  1 | Laptop ASUS                | Rp 8.500.000   |   10
  2 | Mouse Gaming               | Rp 250.000     |   25
  3 | Keyboard Mechanical        | Rp 450.000     |   15
----+----------------------------+----------------+------
```

### Invoice
```
====================================
|           INVOICE FINAL          |
====================================
Laptop ASUS (1 pcs)
Mouse Gaming (2 pcs)
------------------------------------
Subtotal  : Rp 9.000.000
Ongkir    : Rp 50.000
------------------------------------
TOTAL     : Rp 9.050.000
====================================
```

## 🚧 Limitasi

- Maksimal 20 produk dalam sistem
- Maksimal 20 item dalam keranjang belanja
- Data tidak persistent (hilang saat program ditutup)
- Interface berbasis console (text-based)

## 🔮 Pengembangan Selanjutnya

- [ ] Implementasi penyimpanan data ke file
- [ ] Menambah kapasitas produk dan keranjang
- [ ] Fitur search dan filter produk
- [ ] Laporan penjualan harian/bulanan
- [ ] Sistem user authentication
- [ ] GUI interface

> 💡 **Analisis kompleksitas algoritma** dan saran optimisasi performance dapat dilihat di [TECHNICAL_DOCS.md - Optimisasi Potensial](TECHNICAL_DOCS.md#🚀-optimisasi-potensial)

## 📚 Dokumentasi

Proyek ini memiliki dokumentasi lengkap yang terdiri dari:

- **[README.md](README.md)** - Panduan pengguna, instalasi, dan fitur program
- **[TECHNICAL_DOCS.md](TECHNICAL_DOCS.md)** - Dokumentasi teknis mendalam untuk developer
- **[index.pas](index.pas)** - Source code utama dengan struktur yang rapi dan terkommentari

### 🎯 Untuk Pengguna
Jika Anda ingin **menggunakan program**, baca [README.md](README.md) untuk:
- Cara instalasi dan menjalankan program
- Panduan penggunaan fitur-fitur
- Contoh screenshot dan output

### 🔧 Untuk Developer  
Jika Anda ingin **memahami atau mengembangkan** program, baca [TECHNICAL_DOCS.md](TECHNICAL_DOCS.md) untuk:
- Penjelasan setiap fungsi dan algoritma
- Analisis kompleksitas dan optimisasi
- Struktur data dan design patterns
- Tips pengembangan lanjutan

## 📄 Lisensi

Program ini dibuat untuk tujuan pembelajaran dan dapat digunakan secara bebas.

## 👨‍💻 Kontributor

- **Author**: Sistem Penjualan Sederhana
- **Repository**: [Toko-Online-Sederhana](https://github.com/abifadilahs/Toko-Online-Sederhana)

---

📝 **Catatan**: Program ini dikembangkan menggunakan Free Pascal dan telah diuji pada compiler FPC versi 3.2.2. Pastikan compiler Pascal terinstall sebelum menjalankan program.