import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

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
    final locationsList = ['Semarang', 'Bandung', 'Jakarta', 'Surabaya'];

    // Format tanggal ke "20 July 2022"
    String formatDate(DateTime? dt) {
      if (dt == null) return '-';
      final months = [
        '',
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
      return '${dt.day} ${months[dt.month]} ${dt.year}';
    }

    // Format time ke "07.00"
    String formatTime(TimeOfDay? t) {
      if (t == null) return '-';
      final hour = t.hour.toString().padLeft(2, '0');
      final minute = t.minute.toString().padLeft(2, '0');
      return '$hour.$minute';
    }

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label Pick up
          const Text(
            'Pick up',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),

          // Baris label Locations | Date | Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: Text(
                  'Locations',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Date',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Time',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          // const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Locations Dropdown
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: location ?? '-',
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: [
                        DropdownMenuItem(
                          value: '-',
                          child: Align(
                            alignment:
                                Alignment.centerLeft, // rata kiri untuk item
                            child: Text('-', style: TextStyle(fontSize: 8)),
                          ),
                        ),
                        ...locationsList.map(
                          (loc) => DropdownMenuItem(
                            value: loc,
                            child: Align(
                              alignment:
                                  Alignment.centerLeft, // rata kiri untuk item
                              child: Text(
                                loc,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                      onChanged: (val) {
                        if (val == '-') {
                          onChangeLocation?.call(null);
                        } else {
                          onChangeLocation?.call(val);
                        }
                      },
                      style: TextStyle(
                        fontSize: 8,
                        color:
                            location == null || location == '-'
                                ? Colors.grey.shade600
                                : AppColors.black.withOpacity(0.6),
                        overflow: TextOverflow.ellipsis,
                      ),
                      // agar text yang dipilih juga rata kiri
                      selectedItemBuilder: (context) {
                        return ['-', ...locationsList].map((val) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              val,
                              style: TextStyle(
                                fontSize: 8,
                                color:
                                    val == '-' || location == null
                                        ? Colors.grey.shade600
                                        : AppColors.black.withOpacity(0.6),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Date picker button
              Expanded(
                child: GestureDetector(
                  onTap: onPickDate,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          formatDate(date),
                          style: TextStyle(
                            color:
                                date == null
                                    ? Colors.grey.shade600
                                    : Colors.black,
                            fontSize: 8,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.keyboard_arrow_down, size: 20),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Time picker button
              Expanded(
                child: GestureDetector(
                  onTap: onPickTime,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          formatTime(time),
                          style: TextStyle(
                            color:
                                time == null
                                    ? Colors.grey.shade600
                                    : Colors.black,
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.keyboard_arrow_down, size: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
