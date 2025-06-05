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
    final locationsList = [
      'Semarang',
      'Bandung',
      'Jakarta',
      'Surabaya',
      'Yogyakarta',
      'Malang',
      'Denpasar',
      'Makassar',
      'Medan',
      'Balikpapan',
      'Padang',
      'Palembang',
      'Pontianak',
      'Manado',
    ];

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
      return '${dt.day} ${months[dt.month]} ${dt.year}';
    }

    String formatTime(TimeOfDay? t) {
      if (t == null) return '-';
      final hour = t.hour.toString().padLeft(2, '0');
      final minute = t.minute.toString().padLeft(2, '0');
      return '$hour.$minute';
    }

    const double labelFontSize = 12;
    const double valueFontSize = 10;
    const double arrow_size = 15;

    Widget _buildLocationPicker(BuildContext context) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Location',
              style: TextStyle(
                fontSize: labelFontSize,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () async {
                final selected = await showModalBottomSheet<String>(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  builder: (BuildContext ctx) {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          title: const Text('-'),
                          onTap: () => Navigator.pop(ctx, '-'),
                        ),
                        ...locationsList.map(
                          (loc) => ListTile(
                            title: Text(loc),
                            onTap: () => Navigator.pop(ctx, loc),
                          ),
                        ),
                      ],
                    );
                  },
                );

                if (selected == '-') {
                  onChangeLocation?.call(null);
                } else if (selected != null) {
                  onChangeLocation?.call(selected);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        location ?? '-',
                        style: TextStyle(
                          fontSize: valueFontSize,
                          color:
                              location == null
                                  ? Colors.grey.shade600
                                  : AppColors.black.withOpacity(0.6),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.keyboard_arrow_down, size: arrow_size),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildDatePicker() {
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
                        fontSize: valueFontSize - 3,
                        color:
                            date == null ? Colors.grey.shade600 : Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.keyboard_arrow_down, size: arrow_size),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildTimePicker() {
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
                        color:
                            time == null ? Colors.grey.shade600 : Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.keyboard_arrow_down, size: arrow_size),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

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
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize:
                    MainAxisSize.min, // penting agar lebar Row mengikuti konten
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildLocationPicker(context),
                  const VerticalDivider(
                    thickness: 0.8,
                    width: 20,
                    color: Colors.grey,
                  ),
                  _buildDatePicker(),
                  const VerticalDivider(
                    thickness: 0.8,
                    width: 20,
                    color: Colors.grey,
                  ),
                  _buildTimePicker(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
