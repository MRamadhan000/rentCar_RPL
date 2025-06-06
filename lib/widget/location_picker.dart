import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class LocationPicker extends StatelessWidget {
  final String? location;
  final void Function(String?)? onChangeLocation;

  const LocationPicker({super.key, this.location, this.onChangeLocation});

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

    const double labelFontSize = 12;
    const double arrowSize = 15;
    const double valueFontSize = 9;

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
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
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
            child: Container(
              width: double.infinity,
              padding:
                  EdgeInsets.zero, // <--- penting! biar bener-bener 0 padding
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ), // padding vertikal ditambahkan di sini
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Tampilkan nama lokasi dulu
                    Flexible(
                      child: Text(
                        location ?? '',
                        style: TextStyle(
                          fontSize: valueFontSize,
                          color: location == null ? Colors.grey : Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.keyboard_arrow_down, size: arrowSize),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
