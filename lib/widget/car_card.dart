import 'package:flutter/material.dart';
import '../models/car.dart'; // import model Car
import '../utils/app_colors.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final String imageAsset = 'assets/images/car.png';
  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    // Hitung diskon (contoh: 15%)
    final int discountAmount = (car.pricePerDay * 0.15).round();
    final int discountedPrice = car.pricePerDay - discountAmount;

    return Card(
      color: Colors.white,
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama dan merk mobil
            Text(
              car.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(car.brand),
            SizedBox(height: 10),

            // Gambar mobil
            Image.asset(imageAsset, height: 150, fit: BoxFit.cover),
            SizedBox(height: 10),

            // Info: Fuel, Transmisi, Penumpang
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Fuel
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        car.fuelIcon,
                        size: 18,
                        color: AppColors.secondaryBlue,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "${car.fuelAmount} L",
                        style: TextStyle(
                          color: AppColors.secondaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Transmisi
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        car.isManual ? Icons.settings : Icons.settings_suggest,
                        size: 18,
                        color:
                            AppColors
                                .secondaryBlue,
                      ),
                      SizedBox(width: 4),
                      Text(
                        car.isManual ? "Manual" : "Matic",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Penumpang
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people, size: 18, color: AppColors.secondaryBlue),
                      SizedBox(width: 4),
                      Text(
                        "${car.passengers} People",
                        style: TextStyle(
                          color: AppColors.secondaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Harga setelah diskon dan tombol Rent Now
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Harga (diskon dan coret)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rp $discountedPrice / day",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Rp ${car.pricePerDay}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),

                // Tombol Rent Now
                ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol ditekan
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Rent Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
