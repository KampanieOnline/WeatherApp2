import 'package:weather_app/forecast/data/models/weather.dart';

abstract class WeatherRemoteDataSource {
  Future<Weather> fetchWeather();
}

/* abstract class MoonRemoteDataSource {
  Future<Weather> fetchMoonState();
}*/