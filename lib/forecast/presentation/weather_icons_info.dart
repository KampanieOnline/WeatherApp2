import 'package:flutter/material.dart';

class WeatherIconsInfo extends StatelessWidget {
  const WeatherIconsInfo({
    Key? key,
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
        ],
      ),
    );
  }
}