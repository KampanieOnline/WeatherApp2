import 'package:dartz/dartz.dart';
import 'package:weather_app/forecast/data/models/failure.dart';
import 'package:weather_app/forecast/data/models/weather.dart';
import 'package:weather_app/forecast/domain/repository/weather_repository.dart';

class GetWeatherUsecase {
  const GetWeatherUsecase(this.weatherRepository);
final WeatherRepository weatherRepository;
//final/var + typ zmiennej + nazwa zmiennej
  Future<Either<Failure, Weather>> call() => weatherRepository.fetchWeather();
  // typ danych zwrotnych + nazwa własna metody, lambda, ciało metody

}

