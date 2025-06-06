import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class TimePicker extends StatelessWidget {
  final TimeOfDay? time;
  final void Function()? onPickTime;

  const TimePicker({super.key, this.time, this.onPickTime});

  String formatTime(TimeOfDay? t) {
    if (t == null) return '-';
    final hour = t.hour.toString().padLeft(2, '0');
    final minute = t.minute.toString().padLeft(2, '0');
    return '$hour.$minute';
  }

  @override
  Widget build(BuildContext context) {
    const double labelFontSize = 12;
    const double valueFontSize = 9;
    const double arrowSize = 15;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Time',
            style: TextStyle(
              fontSize: labelFontSize,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: onPickTime,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Text(
                    formatTime(time),
                    style: TextStyle(
                      fontSize: valueFontSize,
                      color: time == null ? Colors.grey.shade600 : Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down, size: arrowSize),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
