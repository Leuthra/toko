program SistemPenjualanSederhana;

uses crt; // Library untuk menggunakan clrscr, readkey, dll.

const
  MAX_PRODUK = 20; // Jumlah maksimal produk yang bisa diinput

// Tipe data untuk menyimpan detail satu produk
type
  TProduk = record
    nama: string[50];
    harga: longint; // Menggunakan longint untuk harga yang lebih besar
    stok: integer;
  end;

// Variabel global yang akan digunakan di seluruh program
var
  DaftarProduk: array[1..MAX_PRODUK] of TProduk; // Array untuk menyimpan semua produk
  JumlahProduk: integer = 0; // Pencatat jumlah produk yang sudah diinput
  Keranjang: array[1..MAX_PRODUK] of TProduk; // Keranjang belanja
  JumlahBeli: array[1..MAX_PRODUK] of integer; // Jumlah per item di keranjang
  ItemDiKeranjang: integer = 0; // Pencatat jumlah item di keranjang
  pilihan: char;

// =======================================================================
// MODUL 1: Prosedur untuk menginput data produk (nama, harga, stok)
// =======================================================================
procedure Modul1_InputDataProduk;
var
  tambahLagi: char;
begin
  repeat
    clrscr; // Bersihkan layar
    writeln('====================================');
    writeln('|      MODUL 1: INPUT PRODUK       |');
    writeln('====================================');

    // Cek apakah array produk sudah penuh
    if JumlahProduk < MAX_PRODUK then
    begin
      JumlahProduk := JumlahProduk + 1; // Tambah counter produk
      writeln('Masukkan data untuk Produk ke-', JumlahProduk, ':');

      write('  -> Nama Produk : ');
      readln(DaftarProduk[JumlahProduk].nama);

      write('  -> Harga Produk: Rp ');
      readln(DaftarProduk[JumlahProduk].harga);

      write('  -> Stok Produk : ');
      readln(DaftarProduk[JumlahProduk].stok);

      writeln;
      writeln('--- Produk berhasil ditambahkan! ---');
    end
    else
    begin
      writeln('Maaf, kapasitas produk sudah penuh!');
      break; // Keluar dari loop jika sudah penuh
    end;

    writeln;
    write('Apakah Anda ingin menambah produk lagi? (y/n): ');
    readln(tambahLagi);

  until (upcase(tambahLagi) <> 'Y');
end;

// =======================================================================
// MODUL 2: Prosedur untuk memilih produk dan jumlah yang dibeli
// =======================================================================
procedure Modul2_PilihProduk;
var
  nomorProduk, kuantitas: integer;
  i: integer;
begin
  clrscr;
  writeln('====================================');
  writeln('|      MODUL 2: BELI PRODUK        |');
  writeln('====================================');

  // Cek apakah sudah ada produk yang diinput
  if JumlahProduk = 0 then
  begin
    writeln('Belum ada produk yang diinput. Silakan input produk terlebih dahulu.');
    write('Tekan ENTER untuk kembali...');
    readln;
    exit; // Keluar dari prosedur jika belum ada produk
  end;

  // Tampilkan daftar produk yang tersedia
  writeln('Daftar Produk Tersedia:');
  for i := 1 to JumlahProduk do
  begin
    writeln(i, '. ', DaftarProduk[i].nama, ' - Rp', DaftarProduk[i].harga, ' (Stok: ', DaftarProduk[i].stok, ')');
  end;
  writeln('------------------------------------');

  // Proses memilih produk
  write('Pilih nomor produk yang ingin dibeli: ');
  readln(nomorProduk);

  // Validasi input nomor produk
  if (nomorProduk > 0) and (nomorProduk <= JumlahProduk) then
  begin
    write('Masukkan jumlah yang ingin dibeli: ');
    readln(kuantitas);

    // Validasi kuantitas (tidak boleh melebihi stok)
    if (kuantitas > 0) and (kuantitas <= DaftarProduk[nomorProduk].stok) then
    begin
      // Tambahkan item ke keranjang
      ItemDiKeranjang := ItemDiKeranjang + 1;
      Keranjang[ItemDiKeranjang] := DaftarProduk[nomorProduk];
      JumlahBeli[ItemDiKeranjang] := kuantitas;

      // Kurangi stok produk yang dipilih
      DaftarProduk[nomorProduk].stok := DaftarProduk[nomorProduk].stok - kuantitas;

      writeln;
      writeln('--- Produk berhasil ditambahkan ke keranjang! ---');
    end
    else
    begin
      writeln('ERROR: Jumlah beli tidak valid atau melebihi stok!');
    end;
  end
  else
  begin
    writeln('ERROR: Nomor produk tidak ditemukan!');
  end;

  write('Tekan ENTER untuk melanjutkan...');
  readln;
end;

// =======================================================================
// MODUL 3 & 4: Hitung total belanja + ongkir & cetak invoice
// =======================================================================
procedure Modul3dan4_CetakInvoice;
var
  i: integer;
  subTotal, ongkir, totalBayar: longint;
begin
  clrscr;
  writeln('====================================');
  writeln('|     MODUL 3 & 4: INVOICE         |');
  writeln('====================================');

  // Cek apakah keranjang kosong
  if ItemDiKeranjang = 0 then
  begin
    writeln('Keranjang belanja Anda masih kosong.');
    write('Tekan ENTER untuk kembali...');
    readln;
    exit; // Keluar dari prosedur
  end;

  // --- Proses Perhitungan (Modul 3) ---
  subTotal := 0;
  writeln('Detail Belanja:');
  for i := 1 to ItemDiKeranjang do
  begin
    // Tampilkan setiap item di keranjang
    writeln(i, '. ', Keranjang[i].nama);
    writeln('   ', JumlahBeli[i], ' x Rp', Keranjang[i].harga, ' = Rp', JumlahBeli[i] * Keranjang[i].harga);
    // Akumulasi subtotal
    subTotal := subTotal + (JumlahBeli[i] * Keranjang[i].harga);
  end;

  writeln('------------------------------------');
  writeln('Subtotal Belanja : Rp', subTotal);

  // Input ongkos kirim
  write('Masukkan Ongkos Kirim : Rp');
  readln(ongkir);

  totalBayar := subTotal + ongkir;

  // --- Proses Cetak Invoice (Modul 4) ---
  writeln;
  writeln('====================================');
  writeln('|           INVOICE FINAL          |');
  writeln('====================================');
  for i := 1 to ItemDiKeranjang do
  begin
    writeln(Keranjang[i].nama, ' (', JumlahBeli[i], ' pcs)');
  end;
  writeln('------------------------------------');
  writeln('Subtotal  : Rp', subTotal);
  writeln('Ongkir    : Rp', ongkir);
  writeln('------------------------------------');
  writeln('TOTAL     : Rp', totalBayar);
  writeln('====================================');
  writeln('      Terima Kasih Telah Berbelanja! ');
  writeln;

  // Reset keranjang setelah checkout
  ItemDiKeranjang := 0;

  write('Tekan ENTER untuk kembali ke menu utama...');
  readln;
end;

// =======================================================================
// PROGRAM UTAMA
// =======================================================================
begin
  repeat
    clrscr; // Bersihkan layar setiap kali kembali ke menu
    writeln('========================================');
    writeln('|   PROGRAM PENJUALAN ONLINE SEDERHANA  |');
    writeln('========================================');
    writeln('| MENU:                                |');
    writeln('| 1. Input Data Produk                 |');
    writeln('| 2. Pilih & Beli Produk               |');
    writeln('| 3. Lihat Keranjang & Cetak Invoice   |');
    writeln('| 4. Keluar                            |');
    writeln('========================================');
    write('Pilih menu [1-4]: ');
    readln(pilihan);

    // Pilihan menu menggunakan case
    case pilihan of
      '1': Modul1_InputDataProduk;
      '2': Modul2_PilihProduk;
      '3': Modul3dan4_CetakInvoice;
      '4': writeln('Terima kasih telah menggunakan program ini.');
      else
        writeln('Pilihan tidak valid! Tekan ENTER untuk mencoba lagi.');
        readln;
    end;

  until pilihan = '4'; // Loop akan berhenti jika user memilih '4'
end.
