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
          const Text(
            'Pick up',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
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
                DatePicker(
                  date: date,
                  onPickDate: onPickDate,
                ),
                const VerticalDivider(
                  thickness: 0.8,
                  width: 20,
                  color: Colors.grey,
                ),
                TimePicker(
                  time: time,
                  onPickTime: onPickTime,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
