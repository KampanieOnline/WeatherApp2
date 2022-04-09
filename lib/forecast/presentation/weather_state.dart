import 'package:flutter/material.dart';

class WeatherState extends StatelessWidget {
  const WeatherState({
    Key? key, required this.temp,
  }) : super(key: key);

  final String temp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          temp,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 90,
          ),
        ),
        Text(
          'Thunderstorm',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 35,
          ),
        ),
        Text(
          'Monday, 17 may',
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