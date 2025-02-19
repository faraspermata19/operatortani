import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
        logoPath: 'assets/logo2.png', // Ganti dengan path logo Anda
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang di Aplikasi Operator Tani',
              style: TextStyles.headerText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Buka Dashboard',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
