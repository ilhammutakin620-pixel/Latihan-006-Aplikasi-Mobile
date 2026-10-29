# Latihan 006 - Aplikasi Profil (Tugas Praktikum Hari 1)

* **Nama:** Muhammad Ilham Muttaqim  
* **Mata Kuliah:** Aplikasi Mobile 
* **Dosen:** I Ketut Gunawan, S.Kom, M.T.I.  

---

## Tugas Hari 1: Membuat Kerangka Utama

Target tugas hari pertama adalah membuat struktur dasar halaman profil menggunakan `Scaffold`, `AppBar`, `CircleAvatar`, dan `Text` dengan memisahkan kode menjadi dua file:
1. `lib/main.dart` (untuk inisialisasi aplikasi dan tema)
2. `lib/profile_page.dart` (khusus untuk tampilan halaman profil)


---

## Catatan Perbaikan Kode 

Pada kode contoh di modul praktikum (halaman 17), terdapat beberapa kesalahan/bug yang sengaja disisipkan. Berikut perbaikan yang sudah saya lakukan:

1. **Memisahkan Kode Jadi 2 File**
   * **Masalah:** Di modul, semua kode ditumpuk jadi satu di `main.dart`.
   * **Perbaikan:** Dipisah menjadi `main.dart` dan `profile_page.dart` agar struktur kodenya lebih rapi dan modular.

2. **Memperbaiki Jarak Foto dan Nama (`SizedBox`)**
   * **Masalah:** Di bawah foto (`CircleAvatar`), modul memakai `SizedBox(width: 16)`. Karena posisinya ada di dalam `Column` (arah vertikal), `width` tidak memberikan jarak ke bawah.
   * **Perbaikan:** Diganti menjadi `SizedBox(height: 20)` agar ada jarak vertikal yang pas antara foto profil dan teks nama.

3. **Menghapus `Column` yang Bertumpuk**
   * **Masalah:** Ada `Column` di dalam `Column` yang membungkus teks nama dan profesi secara berlebihan.
   * **Perbaikan:** Disederhanakan menjadi satu `Column` tunggal dari atas ke bawah sesuai instruksi tugas Hari 1.

4. **Membuat Posisi Tampilan di Tengah (`Center`)**
   * **Masalah:** Tampilan profil rata kiri dan kurang simetris di layar.
   * **Perbaikan:** `Column` dibungkus dengan widget `Center` agar foto, nama, bio, dan tombol berada pas di tengah layar.



