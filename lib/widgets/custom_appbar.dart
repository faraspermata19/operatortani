import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String logoPath;
  final List<Widget>? actions; // Tambahkan properti actions

  const CustomAppBar({
    super.key,
    required this.title,
    required this.logoPath,
    this.actions, // Tambahkan parameter actions agar bisa dikustomisasi
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Image.asset(
            logoPath,
            height: 40,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyles.headerText,
          ),
        ],
      ),
      centerTitle: false, // Pastikan logo tetap di kiri
      actions: actions,  // Tambahkan actions ke dalam AppBar
    );
  }
}
