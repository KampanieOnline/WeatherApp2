import 'package:flutter/material.dart';
import 'package:weather_app/forecast/presentation/forecast_screen.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final List<String> listaImion = [
    'Andrew',
    'Jacek',
    'Basia',
    'Andrew',
    'Jacek',
    'Basia',
    'Andrew',
    'Jacek',
    'Basia',
    'Andrew',
    'Jacek',
    'Basia',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10.0),
          buildHeaderSection(context),
          SizedBox(height: 10.0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: GridView.builder(
                itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(1),
                          child: ClipRRect(
                            child: Image.asset("images/andy.png"),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          )),
                      Text(listaImion[index]),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildHeaderSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: CircleAvatar(
            radius: 20, // Image radius
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
    );
  }
}

/*GridView.builder(
itemCount: temps.length,
scrollDirection: Axis.horizontal,
itemBuilder: (context, index) {
return Container(
child:
Text(temps[index], style: TextStyle(color: Colors.white)),
height: 80,
width: 60,
);
},
)*/
