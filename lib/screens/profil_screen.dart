import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profil',
        logoPath: 'assets/logo.png',
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Text('Nama Pengguna', style: TextStyles.headerText),
            SizedBox(height: 8),
            Text('user@example.com', style: TextStyles.bodyText),
            SizedBox(height: 20),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: AppColors.primaryColor),
              title: Text('Pengaturan Akun'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: AppColors.primaryColor),
              title: Text('Bantuan'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Keluar'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
            ),
          ],
        ),
      ),
    );
  }
}
