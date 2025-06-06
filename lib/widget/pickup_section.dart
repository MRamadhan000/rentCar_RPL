import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'location_picker.dart';
import 'date_picker.dart';
import 'time_picker.dart';

class PickupSection extends StatelessWidget {
  final String? location;
  final DateTime? date;
  final TimeOfDay? time;

  final void Function()? onPickDate;
  final void Function()? onPickTime;
  final void Function(String?)? onChangeLocation;

  const PickupSection({
    super.key,
    this.location,
    this.date,
    this.time,
    this.onPickDate,
    this.onPickTime,
    this.onChangeLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 15, // ukuran container luar (outline)
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.3), // warna outline (pudar)
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 8, // ukuran lingkaran dalam (isi solid)
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.blue, // warna isi solid
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8), // jarak antara lingkaran dan tulisan
              const Text(
                'Pick up',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 12),
          
          // Baris untuk memilih lokasi, tanggal, dan waktu
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LocationPicker(
                  location: location,
                  onChangeLocation: onChangeLocation,
                ),
                const VerticalDivider(
                  thickness: 0.8,
                  width: 20,
                  color: Colors.grey,
                ),
                DatePicker(date: date, onPickDate: onPickDate),
                const VerticalDivider(
                  thickness: 0.8,
                  width: 20,
                  color: Colors.grey,
                ),
                TimePicker(time: time, onPickTime: onPickTime),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
