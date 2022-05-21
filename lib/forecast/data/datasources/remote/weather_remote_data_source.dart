import 'package:weather_app/forecast/data/models/weather_data.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherData> fetchWeather();
}

/* abstract class MoonRemoteDataSource {
  Future<Weather> fetchMoonState();
}*/