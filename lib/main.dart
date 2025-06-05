import 'package:flutter/material.dart';
import './widget/car_card.dart';
import './widget/pakrent_appbar.dart';
import './widget/pickup_section.dart';
import './widget/search_section.dart';
import './models/car.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent Car',
      home: CarRentalPage(),
    );
  }
}

class CarRentalPage extends StatefulWidget {
  @override
  _CarRentalPageState createState() => _CarRentalPageState();
}

class _CarRentalPageState extends State<CarRentalPage> {
  String? selectedLocation;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  List<Car> cars = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCars();
  }

  Future<void> loadCars() async {
    final jsonString = await rootBundle.loadString('assets/data/cars.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    setState(() {
      cars = jsonList.map((json) => Car.fromJson(json)).toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PakrentAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchSection(),
              const SizedBox(height: 20),
              PickupSection(
                location: selectedLocation,
                date: selectedDate,
                time: selectedTime,
                onChangeLocation:
                    (val) => setState(() => selectedLocation = val),
                onPickDate: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2026),
                  );
                  if (picked != null) setState(() => selectedDate = picked);
                },
                onPickTime: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) setState(() => selectedTime = time);
                },
              ),

              const SizedBox(height: 20),

              // ⏳ Tampilkan loading saat data belum siap
              if (isLoading)
                Center(child: CircularProgressIndicator())
              else
                ...cars.map((car) => CarCard(car: car)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
