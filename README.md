# Latihan 006 - Aplikasi Profil (Praktikum Pemrograman Mobile)

* **Nama:** Muhammad Ilham Muttaqim  
* **Mata Kuliah:** Aplikasi Mobile (KB1185)  
* **Dosen Pengampu:** I Ketut Gunawan, S.Kom, M.T.I.  

---

## 📌 Riwayat Pengerjaan & Troubleshooting Praktikum

### Hari 1: Kerangka Dasar & Refactoring Awal

#### 1. Pagi (Membuat Kerangka Utama)
* **Tujuan:** Membuat kerangka dasar aplikasi profil dan memisahkan kodenya menjadi dua file:
  * `lib/main.dart`: Titik awal aplikasi untuk mengatur tema (`MaterialApp`) dan memanggil halaman profil.
  * `lib/profile_page.dart`: Berisi tampilan antarmuka profil menggunakan `Scaffold`, `AppBar`, `CircleAvatar`, `Text`, dan tombol `ElevatedButton`.


#### 2. Siang (Extract Widget Bagian 1)
* **Tujuan:** Merapikan kode `profile_page.dart` agar tidak menumpuk di dalam satu `Column` yang panjang.
* **Perubahan:**
  * Membuat widget `ProfileAvatar` untuk mengisolasi foto profil bulat.
  * Membuat widget `ProfileInfo` untuk menampilkan nama dan jabatan secara dinamis dengan parameter (`required this.name` dan `required this.role`).


#### 🛠️ Bug Modul yang Diperbaiki pada Hari 1:
1. **Pemisahan File (Tidak Monolitik):**  
   Di modul, semua kode ditumpuk di satu file `main.dart`. Diperbaiki dengan memisahkannya menjadi `main.dart` dan `profile_page.dart` agar terstruktur dan rapi.
2. **Memperbaiki Jarak Foto dan Nama (`SizedBox`):**  
   Di bawah `CircleAvatar` modul memakai `SizedBox(width: 16)`. Karena berada di dalam `Column` (arah vertikal), `width` tidak ada efeknya. Diperbaiki menjadi `SizedBox(height: 20)` agar terdapat jarak vertikal ke bawah yang pas.
3. **Menghapus `Column` yang Bertumpuk:**  
   Ada `Column` di dalam `Column` yang membungkus teks nama dan jabatan secara berlebihan. Disederhanakan dan diekstrak menjadi komponen `ProfileInfo`.
4. **Membuat Posisi Tampilan di Tengah (`Center`):**  
   Modul hanya memakai `Padding` biasa sehingga konten agak condong ke samping. Diperbaiki dengan membungkus `Column` menggunakan `Center` agar posisi profil simetris di tengah layar.

---

### Hari 2: Menambahkan Komponen Statistik Profil

#### 1. Pagi (Membangun Baris Statistik)
* **Tujuan:** Menambahkan widget `Row` di bawah tombol Edit Profil yang berisi 3 buah `Column` untuk menampilkan ringkasan data profil (Proyek: 12, Followers: 1.2K, Following: 42).


#### 2. Siang (Extract Widget Bagian 2)
* **Tujuan:** Mengekstrak baris statistik menjadi dua komponen Custom Widget baru agar lebih modular dan *reusable*:
  * `ProfileStats`: Mengatur wadah box `Container` dan susunan baris `Row`.
  * `StatItem`: Komponen satuan angka dan teks label yang menggunakan parameter constructor (`count` dan `label`).


#### 🛠️ Bug Modul yang Diperbaiki pada Hari 2:
1. **Tipe Data Salah pada `StatItem` (Halaman 18 Modul):**  
   Pada item Following tertulis `StatItem(count: 42)`, padahal parameter `count` bertipe data `String`. Hal ini menyebabkan error kompilasi (*type mismatch*). Diperbaiki menjadi `StatItem(count: '42')`.
2. **Dimensi Spasi Terbalik di Dalam `Row` (Halaman 18 Modul):**  
   Di antara item di dalam `Row`, modul menulis `SizedBox(height: 24)`. Karena `Row` bekerja secara horizontal, menggunakan `height` tidak memberi jarak mendatar antar item. Diperbaiki menggunakan `MainAxisAlignment.spaceEvenly` pada `Row` agar ketiga kolom statistik tersebar rapi secara otomatis.

---

### Hari 3: Menambahkan Daftar Pengalaman (ListView)

#### 1. Pagi (Implementasi ListView & Expanded)
* **Tujuan:** Menambahkan daftar pengalaman kerja yang dapat digulir (*scrollable*) menggunakan `ListView.builder` dengan data dummy array, serta membungkusnya dengan `Expanded` di dalam `Column`.


#### 2. Siang (Merapikan Tampilan Item List - Card & Extract Widget)
* **Tujuan:** Mengekstrak baris item dalam `ListView.builder` ke dalam Custom Widget mandiri bernama `ExperienceCard`.
* **Perubahan:**
  * Membuat widget `ExperienceCard` dengan parameter `required this.title`.
  * Menambahkan styling visual: efek bayangan kartu (`elevation: 2`), sudut kartu melengkung halus (`RoundedRectangleBorder`), padding konten, dan ikon kerja (`Icons.work`).


#### 🛠️ Bug Modul yang Diperbaiki pada Hari 3:
1. **Error Layout Unbounded Height (`ListView` langsung di dalam `Column`):**  
   * *Masalah di modul:* Pada halaman 18, `ListView.builder` diletakkan langsung di dalam `Column` tanpa pembungkus ukuran pasti atau `Expanded`. Hal ini menyebabkan Flutter crash dengan error *"Vertical viewport was given unbounded height"* karena `Column` tidak membatasi tinggi dan `ListView` mencoba mengambil tinggi tak terhingga (*infinity*).
   * *Solusi:* Membungkus `ListView.builder` dengan widget `Expanded` agar `ListView` mengisi sisa ruang layar yang tersedia secara proporsional dan bisa digulir tanpa error overflow.
2. **Typo Koma pada List Array (Halaman 17 Modul):**  
   * *Masalah di modul:* Pada baris list array `experiences`, item ke-3 (`'Lead Developer - Aplikasi Sekurindo'`) lupa diberi tanda koma (`,`) di ujung barisnya sehingga teks menyambung dengan item berikutnya.
   * *Solusi:* Menambahkan tanda koma pemisah antar item array agar data terbaca rapi sebagai 4 elemen terpisah.

---

