import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
      ),
    );
  }
}

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
