import 'package:dartz/dartz.dart';
import 'package:weather_app/forecast/data/models/failure.dart';
import 'package:weather_app/forecast/data/models/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> fetchWeather(
      );
}

