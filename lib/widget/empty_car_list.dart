import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class EmptyCarList extends StatelessWidget {
  const EmptyCarList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      alignment: Alignment.center,
      child: Column(
        children: [
          Icon(
            Icons.car_repair,
            size: 80,
            color: AppColors.secondaryBlue,
          ),
          const SizedBox(height: 20),
          Text(
            'Mobil tidak ditemukan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Coba kata kunci lain atau ubah filter pencarianmu.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.secondaryGrey,
            ),
          ),
        ],
      ),
    );
  }
}