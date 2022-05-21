import 'package:dartz/dartz.dart';
import 'package:weather_app/forecast/data/models/failure.dart';
import 'package:weather_app/forecast/data/models/weather_data.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherData>> fetchWeather();

  WeatherData getLocalWeather();

  Future<Either<Failure, WeatherData>> fetchTemproraryWeather();
}
