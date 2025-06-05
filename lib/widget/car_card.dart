import 'package:flutter/material.dart';
import '../models/car.dart'; // import model Car

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(car.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(car.brand),
            SizedBox(height: 10),
            // Image.network(car.imageUrl, height: 150, fit: BoxFit.cover),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(car.fuelIcon),
                SizedBox(width: 5),
                Icon(car.isManual ? Icons.settings : Icons.settings_suggest),
                SizedBox(width: 5),
                Icon(Icons.people),
                Text(" ${car.passengers}"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rp ${car.pricePerDay} / hari", style: TextStyle(fontWeight: FontWeight.bold)),
                ElevatedButton(onPressed: () {}, child: Text("Rent Now")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
