import 'package:weather_app/forecast/data/models/weather_data.dart';

abstract class WeatherLocalDataSource {
  void cacheWeather(WeatherData weather);

  WeatherData getWeather();
}
