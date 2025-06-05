// lib/models/car.dart
import 'package:flutter/material.dart';

class Car {
  final String name;
  final String brand;
  final String imageUrl;
  final bool isManual;
  final int passengers;
  final IconData fuelIcon;
  final int pricePerDay;
  final int fuelAmount;  

  Car({
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.isManual,
    required this.passengers,
    required this.fuelIcon,
    required this.pricePerDay,
    required this.fuelAmount,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      name: json['name'],
      brand: json['brand'],
      imageUrl: json['imageUrl'],
      isManual: json['isManual'],
      passengers: json['passengers'],
      fuelIcon: _mapStringToIconData(json['fuelIcon']),
      pricePerDay: json['pricePerDay'],
      fuelAmount: json['fuelAmount'] ?? 0,
    );
  }

  static IconData _mapStringToIconData(String iconName) {
    switch (iconName) {
      case 'local_gas_station':
        return Icons.local_gas_station;
      default:
        return Icons.local_gas_station;
    }
  }
}