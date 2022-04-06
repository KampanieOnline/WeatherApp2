import 'dart:ui';
import 'package:flutter/material.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({Key? key, required Color backgroundColor})
      : super(key: key);

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  List<String> temps = [
    "1",
    "2",
    "3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          buildWeatherInfo(),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              width: 600,
              height: 60,
              child: ListView.builder(
                itemCount: temps.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(temps[index], style: TextStyle(color: Colors.white)),
                    height: 80,
                    width: 60,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildWeatherInfo() {
    return Container(
      width: 600,
      height: 600,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.lightBlueAccent,
            Colors.blue,
          ],
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0.0),
          bottomRight: Radius.circular(90.0),
          topLeft: Radius.circular(0.0),
          bottomLeft: Radius.circular(90.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlue.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Minsk',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 45,
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Image(
              image: AssetImage('images/sun.png'),
            ),
            SizedBox(height: 60.0),
            Text(
              ' 21°',
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
            SizedBox(height: 10.0),
            Divider(thickness: 1, color: Colors.lightBlueAccent),
            SizedBox(height: 10.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: IconButton(
                      icon: Image.asset("images/windy.png", color: Colors.white,),
                      tooltip: "Wietrznie",
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: IconButton(
                      icon: Image.asset("images/sleet.png", color: Colors.white,),
                      tooltip: "Śnieg z deszczem",
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: IconButton(
                      icon: Image.asset("images/rain.png", color: Colors.white,),
                      tooltip: "Deszczowo",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
