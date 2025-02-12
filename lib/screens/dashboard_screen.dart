import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';
import '../screens/absensi_screen.dart';
import '../screens/profil_screen.dart';
import '../screens/daftar_petani_screen.dart'; 
import '../screens/add_lahan_screen.dart'; // Pastikan halaman lain diimpor jika perlu

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Tambahkan navigasi jika ingin berpindah halaman
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/dashboard');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/lokasi');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/dokumen');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/kamera');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profil');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dashboard',
        logoPath: 'assets/logo.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari fitur atau data...',
                  prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Promosi Webinar
              Text('Webinar Terbaru', style: TextStyles.headerText),
              SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 250,
                      margin: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage('assets/webinar_$index.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Webinar ${index + 1}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Pelajari lebih lanjut!',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // Menu Grid
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return _buildMenuItem(
                      context, menuItems[index]['title'], menuItems[index]['icon'], menuItems[index]['route']);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Lokasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            label: 'Dokumen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Kamera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () {
        if (ModalRoute.of(context) != null) {
          Navigator.pushNamed(context, route);
        } else {
          debugPrint("Route tidak ditemukan: $route");
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: AppColors.secondaryColor,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 30, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyles.bodyText.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// List menu untuk GridView
final List<Map<String, dynamic>> menuItems = [
  {'title': 'Tambah Lahan', 'icon': Icons.landscape, 'route': '/add_lahan'},
  {'title': 'Pinjam Modal', 'icon': Icons.money, 'route': '/pinjam_modal'},
  {'title': 'Kelola Pendapatan', 'icon': Icons.attach_money, 'route': '/manage_pendapatan'},
  {'title': 'Kelola Biaya', 'icon': Icons.payment, 'route': '/manage_biaya'},
  {'title': 'Daftar Petani', 'icon': Icons.people, 'route': '/daftar_petani'},
  {'title': 'Absensi', 'icon': Icons.calendar_today, 'route': '/absensi'},
  {'title': 'Divisi', 'icon': Icons.group_work, 'route': '/divisi'},
  {'title': 'Rencana Kerja', 'icon': Icons.work, 'route': '/rencana_kerja'},
  {'title': 'Perawatan Lahan', 'icon': Icons.nature, 'route': '/perawatan_lahan'},
  {'title': 'Panen', 'icon': Icons.agriculture, 'route': '/panen'},
  {'title': 'Evaluasi', 'icon': Icons.assessment, 'route': '/evaluasi'},
  {'title': 'Profil', 'icon': Icons.person, 'route': '/profil'},
];
