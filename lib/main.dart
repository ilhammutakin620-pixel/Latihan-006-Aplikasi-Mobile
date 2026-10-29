import 'package:flutter/material.dart';
import 'profile_page.dart';

void main() {
  // Titik eksekusi pertama
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Profil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      // Menunjuk ProfilePage sebagai halaman utama
      home: const ProfilePage(),
    );
  }
}
