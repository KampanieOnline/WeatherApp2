import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/forecast/data/datasources/local/weather_local_data_source.dart';
import 'package:weather_app/forecast/data/datasources/remote/weather_remote_data_source.dart';
import 'package:weather_app/forecast/data/models/failure.dart';
import 'package:weather_app/forecast/data/models/server_failure.dart';
import 'package:weather_app/forecast/data/models/weather_data.dart';
import 'package:weather_app/forecast/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl(
      this.weatherRemoteDataSource, this.weatherLocalDataSource);

  final WeatherRemoteDataSource weatherRemoteDataSource;
  final WeatherLocalDataSource weatherLocalDataSource;

  @override
  Future<Either<Failure, WeatherData>> fetchWeather() async {
    try {
      final response = await weatherRemoteDataSource.fetchWeather();
      weatherLocalDataSource.cacheWeather(response);
      return Right(response);
    } catch (error) {
      return Left(ServerFailure(''));
    }
  }


  @override
  WeatherData getLocalWeather() {
    final response = weatherLocalDataSource.getWeather();
    return response;
  }

  @override
  Future<Either<Failure, WeatherData>> fetchTemproraryWeather() async {
    try {
      final response = await weatherRemoteDataSource.fetchWeather();
      return Right(response);
    } catch (error) {
      return Left(ServerFailure(''));
    }
  }
}
