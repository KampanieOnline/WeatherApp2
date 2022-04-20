import 'package:weather_app/forecast/data/models/weather.dart';

abstract class WeatherLocalDataSource {
  void cacheWeather(Weather weather);

  Weather getWeather();
}
