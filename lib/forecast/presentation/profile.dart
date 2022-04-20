import 'package:flutter/material.dart';
import 'package:weather_app/forecast/presentation/forecast_screen.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: CircleAvatar(
              radius: 48, // Image radius
              backgroundImage: NetworkImage('images/Andy.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: IconButton(
              icon: Image.asset(
                "images/sleet.png",
                color: Colors.black,
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
                color: Colors.black,
              ),
              tooltip: "Deszczowo",
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Wróć'),
            ),
          ),
        ],
      ),
    );
  }
}
