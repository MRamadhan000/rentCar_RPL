import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class PakrentAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      // Remove default title padding by using flexibleSpace or toolbarHeight with custom layout
      titleSpacing: 0, // supaya title mulai dari tepi kiri AppBar
      title: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Text(
          'PAKRENT',
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 40), // padding kanan 40
          child: Container(
            padding: EdgeInsets.all(2), // jarak antara border dan gambar
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black, // warna border
                width: 2, // ketebalan border
              ),
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile.png'),
              backgroundColor: Colors.grey[200],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}