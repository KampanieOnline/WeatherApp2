import 'package:flutter/material.dart';
import 'package:weather_app/forecast/data/models/weather_data.dart';

class WeatherStateWidget extends StatelessWidget {
  const WeatherStateWidget({
    Key? key,
    required this.weather
  }) : super(key: key);

  final WeatherData weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.main.temp.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 90,
          ),
        ),
        Text(
          weather.state.description,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 35,
          ),
        ),
        Text(
          weather.main.humidity.toString(),
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
