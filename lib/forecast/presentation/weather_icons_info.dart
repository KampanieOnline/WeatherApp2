import 'package:flutter/material.dart';
import 'package:weather_app/forecast/presentation/profile.dart';

class WeatherIconsInfo extends StatelessWidget {
  final Function() onProfileButtonTap;

  const WeatherIconsInfo({
    Key? key,
    required this.onProfileButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: IconButton(
              icon: Image.asset(
                "images/windy.png",
                color: Colors.white,
              ),
              tooltip: "Wietrznie",
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: IconButton(
              icon: Image.asset(
                "images/sleet.png",
                color: Colors.white,
              ),
              tooltip: "Śnieg z deszczem",
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: IconButton(
              icon: Image.asset(
                "images/rain.png",
                color: Colors.white,
              ),
              tooltip: "Deszczowo",
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: onProfileButtonTap,
              child: Text('Mój profil'),
            ),
          ),
        ],
      ),
    );
  }
}
