import 'package:flutter/material.dart';
import 'forecast/presentation/forecast_screen.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Weather App',
    home: ForecastScreen(
      backgroundColor: Colors.black,
    ),
  ));
}
