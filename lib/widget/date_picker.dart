import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class DatePicker extends StatelessWidget {
  final DateTime? date;
  final void Function()? onPickDate;

  const DatePicker({super.key, this.date, this.onPickDate});

  String formatDate(DateTime? dt) {
    if (dt == null) return '-';
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${dt.day} ${months[dt.month - 1]} ${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    const double labelFontSize = 12;
    const double arrowSize = 15;
    const double valueFontSize = 9;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Date',
            style: TextStyle(
              fontSize: labelFontSize,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: onPickDate,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Text(
                    formatDate(date),
                    style: TextStyle(
                      fontSize: valueFontSize,
                      color: date == null ? Colors.grey.shade600 : Colors.black,
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
