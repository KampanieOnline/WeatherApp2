import 'package:flutter/material.dart';
import 'package:weather_app/common/di/di.dart';
import 'forecast/presentation/forecast_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  runApp(const MaterialApp(
    title: 'Weather App',
    home: ForecastScreen(),
  ));
}

