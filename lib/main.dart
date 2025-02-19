import 'package:flutter/material.dart';
import 'package:operatortani/screens/add_lahan_screen.dart';
import 'screens/login_screen.dart';
import 'screens/absensi_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/profil_screen.dart';
import 'screens/daftar_petani_screen.dart';
import 'screens/add_lahan_screen.dart';
import 'screens/panen_laporan.dart';
import 'screens/catatan_panen_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operator Tani',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,

      // Menggunakan initialRoute agar lebih fleksibel
      initialRoute: '/login',

      routes: {
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(), // Tambahkan Dashboard
        '/absensi': (context) => AbsensiScreen(lahanNama: 'Nama Lahan'),
        '/profil': (context) => ProfilScreen(),
        '/daftar_petani': (context) => DaftarPetaniScreen(),
        '/add_lahan': (context) => TambahLahanScreen(),
        '/panen': (context) => LaporanPanenScreen(),
      },
    );
  }
}
