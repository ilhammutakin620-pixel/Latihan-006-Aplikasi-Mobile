# Latihan 006 - Aplikasi Profil (Praktikum Hari 1)

* **Nama:** Muhammad Ilham Muttaqim  
* **Mata Kuliah:** Aplikasi Mobile (KB1185)  
* **Dosen Pengampu:** I Ketut Gunawan, S.Kom, M.T.I.  

---

## 📌 Ringkasan Pengerjaan Hari 1

Di praktikum Hari 1 ini, pengerjaan dibagi menjadi dua tahap sesuai alur modul:

### 1. Pagi — Membuat Kerangka Utama
* **Tujuan:** Membuat kerangka dasar aplikasi profil dan memisahkan kodenya menjadi dua file:
  * `lib/main.dart`: Titik awal aplikasi untuk mengatur tema (`MaterialApp`) dan memanggil halaman profil.
  * `lib/profile_page.dart`: Berisi tampilan antarmuka profil menggunakan `Scaffold`, `AppBar`, `CircleAvatar`, `Text`, dan tombol `ElevatedButton`.


---

### 2. Siang — Extract Widget (Bagian 1)
* **Tujuan:** Merapikan kode `profile_page.dart` agar tidak menumpuk di dalam satu `Column` yang panjang.
* **Perubahan yang Dilakukan:**
  1. **Membuat widget `ProfileAvatar`:** Khusus untuk mengatur tampilan foto profil bulat (`CircleAvatar`).
  2. **Membuat widget `ProfileInfo`:** Khusus untuk menampilkan nama dan jabatan.
  3. **Menerapkan Passing Data (Parameter):** Widget `ProfileInfo` dibuat dinamis menggunakan parameter constructor (`required this.name` dan `required this.role`), sehingga tidak di-hardcode dan bisa dipakai ulang dengan data yang berbeda.
* **Hasil di Halaman Utama (`ProfilePage`):**  
  Struktur kode jadi jauh lebih pendek, rapi, dan mudah dibaca karena tinggal memanggil `ProfileAvatar()` dan `ProfileInfo(...)`.


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




