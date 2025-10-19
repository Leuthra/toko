{
  Program Sistem Penjualan Online Sederhana
  
  Fitur utama:
  - Manajemen produk (tambah, edit, hapus, lihat)
  - Keranjang belanja dengan validasi stok
  - Perhitungan total dan cetak invoice
  
  Bahasa: Pascal / Free Pascal
  Author: Sistem Penjualan Sederhana
}

program SistemPenjualanSederhana;

uses 
  crt, sysutils;

const
  MAX_PRODUK = 20;

type
  TProduk = record
    nama: string[50];
    harga: longint;
    stok: integer;
  end;

var
  DaftarProduk: array[1..MAX_PRODUK] of TProduk;
  JumlahProduk: integer = 0;
  Keranjang: array[1..MAX_PRODUK] of TProduk;
  JumlahBeli: array[1..MAX_PRODUK] of integer;
  ItemDiKeranjang: integer = 0;
  pilihan: char;

{ UTILITY FUNCTIONS }

function BacaAngka(pesan: string): longint;
var
  input: string;
  angka: longint;
  kode: integer;
begin
  repeat
    write(pesan);
    readln(input);
    val(input, angka, kode);
    if kode <> 0 then
      writeln('ERROR: Masukkan angka yang valid!');
  until kode = 0;
  BacaAngka := angka;
end;

function FormatRupiah(harga: longint): string;
var
  strHarga: string;
  i, len: integer;
  hasil: string;
begin
  str(harga, strHarga);
  len := length(strHarga);
  hasil := '';
  
  for i := 1 to len do
  begin
    hasil := hasil + strHarga[i];
    if ((len - i) mod 3 = 0) and (i < len) then
      hasil := hasil + '.';
  end;
  
  FormatRupiah := 'Rp ' + hasil;
end;

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
    write(i:3, ' | ');
    write(DaftarProduk[i].nama:26, ' | ');
    write(FormatRupiah(DaftarProduk[i].harga):14, ' | ');
    writeln(DaftarProduk[i].stok:4);
  end;
  writeln('----+----------------------------+----------------+------');
end;

{ PRODUCT MANAGEMENT MODULES }

procedure InputProdukBaru;
var
  tambahLagi: char;
begin
  repeat
    clrscr;
    writeln('====================================');
    writeln('|        INPUT PRODUK BARU         |');
    writeln('====================================');

    if JumlahProduk < MAX_PRODUK then
    begin
      JumlahProduk := JumlahProduk + 1;
      writeln('Masukkan data untuk Produk ke-', JumlahProduk, ':');

      write('  -> Nama Produk : ');
      readln(DaftarProduk[JumlahProduk].nama);
      DaftarProduk[JumlahProduk].harga := BacaAngka('  -> Harga Produk: Rp ');
      DaftarProduk[JumlahProduk].stok := BacaAngka('  -> Stok Produk : ');

      writeln;
      writeln('--- Produk berhasil ditambahkan! ---');
    end
    else
    begin
      writeln('Maaf, kapasitas produk sudah penuh!');
      break;
    end;

    writeln;
    write('Apakah Anda ingin menambah produk lagi? (y/n): ');
    readln(tambahLagi);

  until (upcase(tambahLagi) <> 'Y');
end;

procedure EditProduk;
var
  nomorProduk: integer;
  pilihEdit: char;
begin
  clrscr;
  writeln('====================================');
  writeln('|         EDIT PRODUK              |');
  writeln('====================================');

  if JumlahProduk = 0 then
  begin
    writeln('Belum ada produk yang bisa diedit.');
    write('Tekan ENTER untuk kembali...');
    readln;
    exit;
  end;

  TampilkanDaftarProduk;
  writeln;
  nomorProduk := BacaAngka('Pilih nomor produk yang ingin diedit: ');

  if (nomorProduk > 0) and (nomorProduk <= JumlahProduk) then
  begin
    writeln;
    writeln('Data produk saat ini:');
    writeln('Nama  : ', DaftarProduk[nomorProduk].nama);
    writeln('Harga : ', FormatRupiah(DaftarProduk[nomorProduk].harga));
    writeln('Stok  : ', DaftarProduk[nomorProduk].stok);
    writeln;

    write('Apa yang ingin diedit? (N)ama/(H)arga/(S)tok/(A)ll: ');
    readln(pilihEdit);

    case upcase(pilihEdit) of
      'N': begin
        write('Nama baru: ');
        readln(DaftarProduk[nomorProduk].nama);
      end;
      'H': DaftarProduk[nomorProduk].harga := BacaAngka('Harga baru: Rp ');
      'S': DaftarProduk[nomorProduk].stok := BacaAngka('Stok baru: ');
      'A': begin
        write('Nama baru: ');
        readln(DaftarProduk[nomorProduk].nama);
        DaftarProduk[nomorProduk].harga := BacaAngka('Harga baru: Rp ');
        DaftarProduk[nomorProduk].stok := BacaAngka('Stok baru: ');
      end;
      else
        writeln('Pilihan tidak valid!');
    end;

    writeln;
    writeln('--- Data produk berhasil diupdate! ---');
  end
  else
    writeln('ERROR: Nomor produk tidak ditemukan!');

  write('Tekan ENTER untuk melanjutkan...');
  readln;
end;

procedure HapusProduk;
var
  nomorProduk, i: integer;
  konfirmasi: char;
begin
  clrscr;
  writeln('====================================');
  writeln('|        HAPUS PRODUK              |');
  writeln('====================================');

  if JumlahProduk = 0 then
  begin
    writeln('Belum ada produk yang bisa dihapus.');
    write('Tekan ENTER untuk kembali...');
    readln;
    exit;
  end;

  TampilkanDaftarProduk;
  writeln;
  nomorProduk := BacaAngka('Pilih nomor produk yang ingin dihapus: ');

  if (nomorProduk > 0) and (nomorProduk <= JumlahProduk) then
  begin
    writeln;
    writeln('Produk yang akan dihapus:');
    writeln('Nama  : ', DaftarProduk[nomorProduk].nama);
    writeln('Harga : ', FormatRupiah(DaftarProduk[nomorProduk].harga));
    writeln('Stok  : ', DaftarProduk[nomorProduk].stok);
    writeln;

    write('Yakin ingin menghapus produk ini? (y/n): ');
    readln(konfirmasi);

    if upcase(konfirmasi) = 'Y' then
    begin
      for i := nomorProduk to JumlahProduk - 1 do
        DaftarProduk[i] := DaftarProduk[i + 1];
      
      JumlahProduk := JumlahProduk - 1;
      writeln;
      writeln('--- Produk berhasil dihapus! ---');
    end
    else
      writeln('Penghapusan dibatalkan.');
  end
  else
    writeln('ERROR: Nomor produk tidak ditemukan!');

  write('Tekan ENTER untuk melanjutkan...');
  readln;
end;

{ SHOPPING MODULES }

procedure BeliProduk;
var
  nomorProduk, kuantitas: integer;
begin
  clrscr;
  writeln('====================================');
  writeln('|         BELI PRODUK              |');
  writeln('====================================');

  if JumlahProduk = 0 then
  begin
    writeln('Belum ada produk yang diinput. Silakan input produk terlebih dahulu.');
    write('Tekan ENTER untuk kembali...');
    readln;
    exit;
  end;

  TampilkanDaftarProduk;
  writeln;
  nomorProduk := BacaAngka('Pilih nomor produk yang ingin dibeli: ');

  if (nomorProduk > 0) and (nomorProduk <= JumlahProduk) then
  begin
    if DaftarProduk[nomorProduk].stok = 0 then
    begin
      writeln('ERROR: Stok produk habis!');
      write('Tekan ENTER untuk melanjutkan...');
      readln;
      exit;
    end;
    
    kuantitas := BacaAngka('Masukkan jumlah yang ingin dibeli: ');

    if (kuantitas > 0) and (kuantitas <= DaftarProduk[nomorProduk].stok) then
    begin
      if ItemDiKeranjang >= MAX_PRODUK then
      begin
        writeln('ERROR: Keranjang belanja sudah penuh!');
        write('Tekan ENTER untuk melanjutkan...');
        readln;
        exit;
      end;

      ItemDiKeranjang := ItemDiKeranjang + 1;
      Keranjang[ItemDiKeranjang] := DaftarProduk[nomorProduk];
      JumlahBeli[ItemDiKeranjang] := kuantitas;
      DaftarProduk[nomorProduk].stok := DaftarProduk[nomorProduk].stok - kuantitas;

      writeln;
      writeln('--- Produk berhasil ditambahkan ke keranjang! ---');
    end
    else
      writeln('ERROR: Jumlah beli tidak valid atau melebihi stok!');
  end
  else
    writeln('ERROR: Nomor produk tidak ditemukan!');

  write('Tekan ENTER untuk melanjutkan...');
  readln;
end;

procedure CetakInvoice;
var
  i: integer;
  subTotal, ongkir, totalBayar: longint;
begin
  clrscr;
  writeln('====================================');
  writeln('|       KERANJANG & INVOICE        |');
  writeln('====================================');

  if ItemDiKeranjang = 0 then
  begin
    writeln('Keranjang belanja Anda masih kosong.');
    write('Tekan ENTER untuk kembali...');
    readln;
    exit;
  end;

  subTotal := 0;
  writeln('Detail Belanja:');
  writeln('No. | Produk                     | Qty | Harga      | Total');
  writeln('----+----------------------------+-----+------------+--------------');
  
  for i := 1 to ItemDiKeranjang do
  begin
    write(i:3, ' | ');
    write(Keranjang[i].nama:26, ' | ');
    write(JumlahBeli[i]:3, ' | ');
    write(FormatRupiah(Keranjang[i].harga):10, ' | ');
    writeln(FormatRupiah(JumlahBeli[i] * Keranjang[i].harga):12);
    subTotal := subTotal + (JumlahBeli[i] * Keranjang[i].harga);
  end;

  writeln('----+----------------------------+-----+------------+--------------');
  writeln('Subtotal Belanja : ', FormatRupiah(subTotal));
  ongkir := BacaAngka('Masukkan Ongkos Kirim : Rp ');
  totalBayar := subTotal + ongkir;

  writeln;
  writeln('====================================');
  writeln('|           INVOICE FINAL          |');
  writeln('====================================');
  
  for i := 1 to ItemDiKeranjang do
    writeln(Keranjang[i].nama, ' (', JumlahBeli[i], ' pcs)');
    
  writeln('------------------------------------');
  writeln('Subtotal  : ', FormatRupiah(subTotal));
  writeln('Ongkir    : ', FormatRupiah(ongkir));
  writeln('------------------------------------');
  writeln('TOTAL     : ', FormatRupiah(totalBayar));
  writeln('====================================');
  writeln('      Terima Kasih Telah Berbelanja! ');
  writeln;

  ItemDiKeranjang := 0;
  write('Tekan ENTER untuk kembali ke menu utama...');
  readln;
end;

procedure TampilkanMenu;
begin
  clrscr;
  writeln('==========================================');
  writeln('|   PROGRAM PENJUALAN ONLINE SEDERHANA   |');
  writeln('==========================================');
  writeln('| MENU:                                  |');
  writeln('| 1. Input Data Produk                   |');
  writeln('| 2. Edit Data Produk                    |');
  writeln('| 3. Hapus Data Produk                   |');
  writeln('| 4. Lihat Daftar Produk                 |');
  writeln('| 5. Pilih & Beli Produk                 |');
  writeln('| 6. Lihat Keranjang & Cetak Invoice     |');
  writeln('| 7. Keluar                              |');
  writeln('==========================================');
  write('Pilih menu [1-7]: ');
end;

procedure LihatDaftarProduk;
begin
  clrscr;
  writeln('====================================');
  writeln('|        DAFTAR PRODUK             |');
  writeln('====================================');
  TampilkanDaftarProduk;
  writeln;
  write('Tekan ENTER untuk kembali...');
  readln;
end;

{ MAIN PROGRAM }
begin
  repeat
    TampilkanMenu;
    readln(pilihan);

    case pilihan of
      '1': InputProdukBaru;
      '2': EditProduk;
      '3': HapusProduk;
      '4': LihatDaftarProduk;
      '5': BeliProduk;
      '6': CetakInvoice;
      '7': writeln('Terima kasih telah menggunakan program ini.');
      else
      begin
        writeln('Pilihan tidak valid! Tekan ENTER untuk mencoba lagi.');
        readln;
      end;
    end;

  until pilihan = '7';
end.
