import 'package:flutter/material.dart';
import 'package:weather_app/forecast/data/models/weather.dart';

class WeatherStateWidget extends StatelessWidget {
  const WeatherStateWidget({
    Key? key,
    required this.weather
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.temp,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 90,
          ),
        ),
        Text(
          weather.state,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 35,
          ),
        ),
        Text(
          weather.day,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
