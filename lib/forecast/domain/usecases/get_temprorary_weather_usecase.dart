import 'package:dartz/dartz.dart';
import 'package:weather_app/forecast/data/models/failure.dart';
import 'package:weather_app/forecast/data/models/weather_data.dart';
import 'package:weather_app/forecast/domain/repository/weather_repository.dart';

class GetTemporaryWeatherUsecase {
  const GetTemporaryWeatherUsecase(this.weatherRepository);

  final WeatherRepository weatherRepository;

  Future<Either<Failure, WeatherData>> call() =>
      weatherRepository.fetchTemproraryWeather();
}
