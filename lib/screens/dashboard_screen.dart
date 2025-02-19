import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

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
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: '', logoPath: 'assets/logo2.png'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari fitur atau data...',
                    prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Promosi Webinar
              Text('Webinar Terbaru', style: TextStyles.headerText),
              SizedBox(height: 10),

              SizedBox(
                height: 160, // Tinggi lebih proporsional
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6, // Bisa lebih banyak webinar
                  itemBuilder: (context, index) {
                    String imagePath = 'assets/webinar_$index.jpg';
                    return Container(
                      width: 220,
                      margin: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                                color: Colors.black.withOpacity(0.6),
                              ),
                              child: Text(
                                'Webinar ${index + 1}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return _buildMenuItem(context, menuItems[index]['title'], menuItems[index]['icon'], menuItems[index]['route']);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Lokasi'),
          BottomNavigationBarItem(icon: Icon(Icons.insert_drive_file), label: 'Dokumen'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Kamera'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        elevation: 8,
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 28, color: AppColors.primaryColor),
            ),
            SizedBox(height: 8),
            Text(title, style: TextStyles.bodyText.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> menuItems = [
  {'title': 'Tambah Lahan', 'icon': Icons.landscape, 'route': '/add_lahan'},
  {'title': 'Pinjam Modal', 'icon': Icons.money, 'route': '/pinjam_modal'},
  {'title': 'Kelola Pendapatan', 'icon': Icons.attach_money, 'route': '/manage_pendapatan'},
  {'title': 'Kelola Biaya', 'icon': Icons.payment, 'route': '/manage_biaya'},
  {'title': 'Daftar Petani', 'icon': Icons.people, 'route': '/daftar_petani'},
  {'title': 'Absensi', 'icon': Icons.calendar_today, 'route': '/absensi'},
  {'title': 'Divisi', 'icon': Icons.group_work, 'route': '/divisi'},
  {'title': 'Rencana Kerja', 'icon': Icons.work, 'route': '/rencana_kerja'},
  {'title': 'Evaluasi', 'icon': Icons.assessment, 'route': '/evaluasi'},
  {'title': 'Profil', 'icon': Icons.person, 'route': '/profil'},
];
