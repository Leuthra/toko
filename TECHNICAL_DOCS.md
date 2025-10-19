# 📖 Dokumentasi Teknis - Sistem Penjualan Online Sederhana

Dokumentasi ini menjelaskan semua komponen teknis, fungsi, library, dan struktur data yang digunakan dalam program Pascal.

> 🏠 **Kembali ke panduan utama**: [README.md](README.md) untuk instalasi dan cara penggunaan program
> 
> 📁 **Source code**: [index.pas](index.pas) - Kode program lengkap dengan struktur yang rapi

## 📚 Library & Dependencies

### `crt` - Console Runtime Library
**Fungsi**: Library standard Pascal untuk operasi console/terminal
- `clrscr` - Membersihkan layar console
- `readkey` - Membaca input keyboard tanpa Enter
- `gotoxy(x,y)` - Memindahkan cursor ke posisi tertentu
- `textcolor()` - Mengatur warna text (tidak digunakan dalam program ini)

### `sysutils` - System Utilities
**Fungsi**: Library untuk utilitas sistem dan konversi data
- `val(string, number, code)` - Konversi string ke angka dengan error handling
- Fungsi manipulasi string dan file
- Error handling yang lebih baik

## 🏗️ Struktur Data & Konstanta

### Konstanta
```pascal
const
  MAX_PRODUK = 20;  // Kapasitas maksimal produk dalam sistem
```

### Tipe Data Custom
```pascal
type
  TProduk = record
    nama: string[50];    // Nama produk (max 50 karakter)
    harga: longint;      // Harga produk (4 bytes, range: -2,147,483,648 to 2,147,483,647)
    stok: integer;       // Jumlah stok (2 bytes, range: -32,768 to 32,767)
  end;
```

**Mengapa `longint` untuk harga?**
- Mendukung harga hingga 2+ miliar rupiah
- Mencegah overflow untuk produk mahal
- Kompatibel dengan operasi matematika

### Variabel Global
```pascal
var
  DaftarProduk: array[1..MAX_PRODUK] of TProduk;  // Array produk utama
  JumlahProduk: integer = 0;                      // Counter produk aktif
  Keranjang: array[1..MAX_PRODUK] of TProduk;     // Array keranjang belanja
  JumlahBeli: array[1..MAX_PRODUK] of integer;    // Quantity per item
  ItemDiKeranjang: integer = 0;                   // Counter item keranjang
  pilihan: char;                                  // Input menu user
```

## 🔧 Fungsi Utilitas

### `BacaAngka(pesan: string): longint`
**Tujuan**: Validasi input numerik yang aman dari crash

```pascal
function BacaAngka(pesan: string): longint;
var
  input: string;      // Buffer input user (string)
  angka: longint;     // Hasil konversi
  kode: integer;      // Error code dari val()
begin
  repeat
    write(pesan);
    readln(input);
    val(input, angka, kode);  // val() return 0 jika sukses
    if kode <> 0 then
      writeln('ERROR: Masukkan angka yang valid!');
  until kode = 0;
  BacaAngka := angka;
end;
```

**Cara Kerja**:
1. `val(input, angka, kode)` mencoba konversi string ke angka
2. Jika `kode = 0` → konversi berhasil
3. Jika `kode ≠ 0` → ada error, ulangi input
4. Loop sampai input valid

**Keunggulan**:
- Mencegah runtime error saat input non-numerik
- User-friendly error message
- Otomatis retry sampai input benar

### `FormatRupiah(harga: longint): string`
**Tujuan**: Format angka dengan pemisah ribuan untuk keterbacaan

```pascal
function FormatRupiah(harga: longint): string;
var
  strHarga: string;   // String representation dari angka
  i, len: integer;    // Iterator dan panjang string
  hasil: string;      // String hasil dengan pemisah
begin
  str(harga, strHarga);        // Convert longint to string
  len := length(strHarga);
  hasil := '';
  
  for i := 1 to len do
  begin
    hasil := hasil + strHarga[i];
    // Tambah titik setiap 3 digit dari kanan
    if ((len - i) mod 3 = 0) and (i < len) then
      hasil := hasil + '.';
  end;
  
  FormatRupiah := 'Rp ' + hasil;
end;
```

**Cara Kerja**:
1. `str(harga, strHarga)` - Convert number ke string
2. Loop setiap karakter dari kiri ke kanan
3. `(len - i) mod 3 = 0` - Cek posisi untuk titik
4. Tambah "Rp " prefix

**Contoh Output**:
- Input: `1500000` → Output: `"Rp 1.500.000"`
- Input: `250000` → Output: `"Rp 250.000"`

### `TampilkanDaftarProduk`
**Tujuan**: Display produk dalam format tabel yang rapi

```pascal
procedure TampilkanDaftarProduk;
var
  i: integer;
begin
  if JumlahProduk = 0 then
  begin
    writeln('Belum ada produk yang diinput.');
    exit;
  end;
  
  writeln('Daftar Produk:');
  writeln('No. | Nama Produk                | Harga          | Stok');
  writeln('----+----------------------------+----------------+------');
  for i := 1 to JumlahProduk do
  begin
    write(i:3, ' | ');                                    // Nomor (3 char width)
    write(DaftarProduk[i].nama:26, ' | ');                // Nama (26 char width)
    write(FormatRupiah(DaftarProduk[i].harga):14, ' | '); // Harga (14 char width)
    writeln(DaftarProduk[i].stok:4);                      // Stok (4 char width)
  end;
  writeln('----+----------------------------+----------------+------');
end;
```

**Format Specifier**:
- `:3` - Right-align dalam 3 karakter
- `:26` - Left-align dalam 26 karakter
- `:14` - Format dalam 14 karakter
- `:4` - Right-align dalam 4 karakter

## 🏪 Modul Manajemen Produk

### `InputProdukBaru`
**Fungsi**: Menambah produk baru ke sistem
- Validasi kapasitas maximum (`MAX_PRODUK`)
- Input nama dengan `readln()` (menerima spasi)
- Input harga dan stok dengan `BacaAngka()` (validasi numerik)
- Loop untuk input multiple products

### `EditProduk`
**Fungsi**: Mengubah data produk existing
- Validasi nomor produk dengan `BacaAngka()`
- Menu pilihan: Nama, Harga, Stok, atau All
- `upcase()` untuk case-insensitive input
- Update in-place di array

### `HapusProduk`
**Fungsi**: Menghapus produk dari sistem
- Konfirmasi sebelum delete
- Array shifting untuk mengisi gap
- Update counter `JumlahProduk`

**Array Shifting Logic**:
```pascal
for i := nomorProduk to JumlahProduk - 1 do
  DaftarProduk[i] := DaftarProduk[i + 1];
```

## 🛒 Modul Shopping

### `BeliProduk`
**Fungsi**: Menambah item ke keranjang belanja
- Validasi stok tersedia
- Validasi kapasitas keranjang
- Update stok produk otomatis
- Copy product data ke keranjang

### `CetakInvoice`
**Fungsi**: Generate invoice dan checkout
- Kalkulasi subtotal dengan loop
- Input ongkos kirim
- Display invoice final
- Reset keranjang setelah checkout

**Kalkulasi**:
```pascal
subTotal := subTotal + (JumlahBeli[i] * Keranjang[i].harga);
totalBayar := subTotal + ongkir;
```

## 🎛️ Program Utama

### `TampilkanMenu`
**Fungsi**: Display menu utama yang user-friendly
- `clrscr` untuk clear screen
- ASCII art border untuk estetika
- Menu numbering yang konsisten

### Flow Control
```pascal
repeat
  TampilkanMenu;
  readln(pilihan);
  case pilihan of
    '1': InputProdukBaru;
    // ... other menu options
  end;
until pilihan = '7';
```

**Mengapa `repeat-until`?**
- Garantisi menu tampil minimal 1 kali
- Loop sampai user pilih exit ('7')
- Lebih natural untuk menu system

## 🔐 Validasi & Error Handling

### Input Validation
1. **Numerik**: `BacaAngka()` dengan `val()` function
2. **Range**: Check `(nomor > 0) and (nomor <= maksimum)`
3. **Capacity**: Check array bounds sebelum insert
4. **Stock**: Validasi ketersediaan sebelum purchase

### Error Messages
- User-friendly dalam Bahasa Indonesia
- Consistent format: "ERROR: [pesan]"
- Instruction untuk user action selanjutnya

## 📊 Kompleksitas Algoritma

### Time Complexity
- **Insert Product**: O(1) - Direct array access
- **Delete Product**: O(n) - Array shifting required  
- **Display Products**: O(n) - Loop through all products
- **Search Product**: O(1) - Direct index access
- **Format Currency**: O(m) - m = number of digits

### Space Complexity
- **Total**: O(n) - n = MAX_PRODUK
- **Arrays**: 2 × MAX_PRODUK × sizeof(TProduk)
- **Fixed size**, tidak dynamic allocation

## 🚀 Optimisasi Potensial

### Performance
1. **Dynamic Arrays** - Hemat memory untuk produk sedikit
2. **Binary Search** - Untuk pencarian produk (perlu sorting)
3. **Hash Table** - Untuk pencarian nama produk cepat

### Memory
1. **String allocation** - Dynamic string vs fixed string[50]
2. **Record packing** - Optimasi layout memory
3. **Pointer usage** - Untuk struktur data besar

### User Experience
1. **Input buffering** - Prevent multiple ENTER presses
2. **Color coding** - Error = red, success = green
3. **Progress indicators** - Untuk operasi yang lama

## 🔗 Navigasi Dokumentasi

- **[⬅️ README.md](README.md)** - Kembali ke panduan pengguna dan instalasi
- **[📁 index.pas](index.pas)** - Lihat source code lengkap
- **[🌐 Repository](https://github.com/abifadilahs/Toko-Online-Sederhana)** - GitHub repository

---

📝 **Catatan**: Program ini menggunakan paradigma procedural Pascal dengan fokus pada simplicity dan readability. Struktur data dipilih untuk kemudahan pembelajaran, bukan optimal performance.