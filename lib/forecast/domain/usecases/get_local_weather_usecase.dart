import 'package:dartz/dartz.dart';
import 'package:weather_app/forecast/data/models/failure.dart';
import 'package:weather_app/forecast/data/models/weather_data.dart';
import 'package:weather_app/forecast/domain/repository/weather_repository.dart';

class GetLocalWeatherUsecase {
  const GetLocalWeatherUsecase(this.weatherRepository);
  final WeatherRepository weatherRepository;
//final/var + typ zmiennej + nazwa zmiennej
  WeatherData call() => weatherRepository.getLocalWeather();
// typ danych zwrotnych + nazwa własna metody, lambda, ciało metody

}
