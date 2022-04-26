import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/models/base_state.dart';
import 'package:weather_app/common/models/error_state.dart';
import 'package:weather_app/forecast/bloc/weather_bloc.dart';
import 'package:weather_app/forecast/bloc/weather_event.dart';
import 'package:weather_app/forecast/bloc/weather_state.dart';
import 'package:weather_app/forecast/data/datasources/local/weather_local_data_source.dart';
import 'package:weather_app/forecast/data/datasources/local/weather_local_data_source_impl.dart';
import 'package:weather_app/forecast/data/datasources/remote/weather_remote_data_source_impl.dart';
import 'package:weather_app/forecast/data/models/weather.dart';
import 'package:weather_app/forecast/data/repository/weather_repository_impl.dart';
import 'package:weather_app/forecast/domain/usecases/get_local_weather_usecase.dart';
import 'package:weather_app/forecast/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/forecast/presentation/profile.dart';
import 'package:weather_app/forecast/presentation/weather_icons_info.dart';
import 'package:weather_app/forecast/presentation/weather_state_widget.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  List<String> temps = [
    "1",
    "2",
    "3",
  ];

  Weather? weather;
  bool isLoading = false;
  bool isError = false;

  late WeatherBloc bloc;

  @override
  void initState() {
    bloc = WeatherBloc(
      GetWeatherUsecase(
        WeatherRepositoryImpl(
          WeatherRemoteDataSourceImpl(),
          WeatherLocalDataSourceImpl(),
        ),
      ),
      GetLocalWeatherUsecase(
        WeatherRepositoryImpl(
          WeatherRemoteDataSourceImpl(),
          WeatherLocalDataSourceImpl(),
        ),
      ),
    );
    // bloc.add(GetWeatherEvent());
    bloc.add(GetLocalWeatherEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider(
        child: buildListener(),
        create: (context) => bloc,
      ),
    );
  }

  BlocListener<WeatherBloc, BaseState> buildListener() => BlocListener(
        listener: (BuildContext context, state) {
          if (state is LoadingWeatherState) {
            setState(() {
              isLoading = true;
            });
          } else if (state is LoadedWeatherState) {
            setState(() {
              weather = state.weatherResponse;
              isLoading = false;
              isError = false;
            });
          } else if (state is ErrorState) {
            setState(() {
              isLoading = false;
              isError = true;
            });
          } else if (state is LoadingLocalWeatherState) {
            setState(() {
              isLoading = true;
            });
          } else if (state is LoadedLocalWeatherState) {
            setState(() {
              weather = state.weatherResponse;
              isLoading = false;
              isError = false;
            });
          }
        },
        child: buildContent(),
      );

  Column buildContent() {
    return Column(
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
                  child:
                      Text(temps[index], style: TextStyle(color: Colors.white)),
                  height: 80,
                  width: 60,
                );
              },
            ),
          ),
        )
      ],
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
            if (weather != null)
              WeatherStateWidget(
                weather: weather!,
              ),
            if (isLoading) Text('ładowanie'),
            if (isError) Text('Coś poszło nie tak...'),
            SizedBox(height: 10.0),
            Divider(thickness: 1, color: Colors.lightBlueAccent),
            SizedBox(height: 10.0),
            WeatherIconsInfo(
              onProfileButtonTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
