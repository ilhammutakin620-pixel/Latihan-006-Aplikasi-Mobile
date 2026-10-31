import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Dummy list pengalaman kerja (sesuai modul praktikum halaman 17)
  final List<String> experiences = const [
    'Senior Backend Engineer - EDC Bank DKI',
    'Backend & System Architect - Secure Payment EDC',
    'Lead Developer - Aplikasi Sekurindo',
    'Backend Engineer - Pengembangan Sistem E-money',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Custom Widget untuk Foto Profil
            const ProfileAvatar(),
            const SizedBox(height: 20),

            // Custom Widget untuk Info (dengan passing data nama & role)
            const ProfileInfo(
              name: 'Muhammad Ilham Muttaqim',
              role: 'Mahasiswa TI Angkatan 24 Global Institute',
            ),
            const SizedBox(height: 32),

            // Tombol interaksi standar
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profil'),
            ),
            const SizedBox(height: 24),

            // Custom Widget untuk Statistik Profil
            const ProfileStats(),
            const SizedBox(height: 24),

            // Judul Daftar Pengalaman Kerja
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pengalaman Kerja',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),

            // Hari 3: ListView.builder yang memanggil Custom Widget ExperienceCard
            Expanded(
              child: ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  return ExperienceCard(
                    title: experiences[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// CUSTOM WIDGETS HASIL EXTRACT (REUSABLE)
// ==========================================

// 1. Custom Widget: ProfileAvatar (Menangani tampilan foto profil)
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 60,
      backgroundColor: Colors.grey,
      child: Icon(Icons.person, size: 60, color: Colors.white),
    );
  }
}

// 2. Custom Widget: ProfileInfo (Menerapkan passing data untuk nama dan role)
class ProfileInfo extends StatelessWidget {
  final String name;
  final String role;

  const ProfileInfo({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          role,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// 3. Custom Widget: ProfileStats (Menangani baris container statistik)
class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StatItem(count: '12', label: 'Proyek'),
          StatItem(count: '1.2K', label: 'Followers'),
          StatItem(count: '42', label: 'Following'),
        ],
      ),
    );
  }
}

// 4. Custom Widget: StatItem (Item satuan angka dan label agar reusable)
class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({
    super.key,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

// 5. Custom Widget: ExperienceCard (Mengekstrak baris ListView menjadi komponen mandiri & rapi)
class ExperienceCard extends StatelessWidget {
  final String title;

  const ExperienceCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: const Icon(Icons.work, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
