import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String logoPath;
  final List<Widget>? actions; // Tambahkan properti actions

  CustomAppBar({
    required this.title,
    required this.logoPath,
    this.actions, // Tambahkan parameter actions agar bisa dikustomisasi
  });

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            logoPath,
            height: 50,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyles.headerText,
          ),
        ],
      ),
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      elevation: 0,
      actions: actions, // Tambahkan actions ke dalam AppBar
    );
  }
}
