# Latihan 006 - Aplikasi Profil (Praktikum Pemrograman Mobile)

* **Nama:** Muhammad Ilham Muttaqim  
* **Mata Kuliah:** Aplikasi Mobile (KB1185)  
* **Dosen Pengampu:** I Ketut Gunawan, S.Kom, M.T.I.  

---

## 📌 Riwayat Pengerjaan Praktikum

### Hari 1: Kerangka Dasar & Refactoring Awal
1. **Pagi (Membuat Kerangka Utama):**  
   Membuat struktur dasar halaman profil dan memisahkan kodenya menjadi dua file (`lib/main.dart` untuk inisialisasi tema `MaterialApp` dan `lib/profile_page.dart` untuk kerangka `Scaffold`, `AppBar`, dan `Column`).  
   *Pesan Commit:* `feat: create basic profile page structure with avatar and text`

2. **Siang (Extract Widget Bagian 1):**  
   Merapikan kode `profile_page.dart` dengan memecah `Column` panjang menjadi dua Custom Widget mandiri: `ProfileAvatar` (foto profil) dan `ProfileInfo` (nama & jabatan dengan passing data).  
   *Pesan Commit:* `refactor: extract avatar and info into custom widgets`

---

### Hari 2: Menambahkan Komponen Statistik Profil
1. **Pagi (Membangun Baris Statistik):**  
   Menambahkan widget `Row` di bawah tombol Edit Profil yang berisi 3 buah `Column` untuk menampilkan ringkasan data profil:
   * **Proyek:** Angka "12" dan label "Proyek"
   * **Followers:** Angka "1.2K" dan label "Followers"
   * **Following:** Angka "42" dan label "Following"
   
   Diberi container berlatar belakang biru muda melengkung (`BoxDecoration`) dan spasi yang rapi (`MainAxisAlignment.spaceEvenly`).  
   *Pesan Commit:* `feat: add profile statistics row`

---

## 🛠️ Catatan Perbaikan Bug 

Sesuai instruksi modul di halaman 14 untuk melatih *troubleshooting*, berikut beberapa error/jebakan pada kode modul yang berhasil diperbaiki:

1. **Memperbaiki Jarak Foto dan Nama (`SizedBox`)**
   * *Masalah di modul:* Di bawah `CircleAvatar` tertulis `SizedBox(width: 16)`. Karena berada di dalam `Column` (arah vertikal), memberi `width` tidak ada efeknya sama sekali sehingga foto dan teks nama menempel rapat.
   * *Solusi:* Diubah menjadi `SizedBox(height: 20)` agar ada jarak vertikal ke bawah yang pas.

2. **Menghapus `Column` yang Bertumpuk**
   * *Masalah di modul:* Ada `Column` di dalam `Column` yang membungkus teks nama dan jabatan tanpa alasan yang jelas.
   * *Solusi:* Disederhanakan dan diekstrak menjadi komponen `ProfileInfo` yang mandiri.

3. **Membuat Posisi Tampilan di Tengah (`Center`)**
   * *Masalah di modul:* Hanya memakai `Padding` biasa sehingga konten agak condong ke samping.
   * *Solusi:* `Column` dibungkus dengan widget `Center` agar foto, nama, dan tombol berada simetris tepat di tengah layar.

4. **Pemisahan File (Tidak Monolitik)**
   * *Masalah di modul:* Semua kode ditumpuk di dalam satu file `main.dart`.
   * *Solusi:* Dipisah menjadi `main.dart` dan `profile_page.dart` agar rapi dan terstruktur.




