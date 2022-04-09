import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/forecast/data/datasources/remote/weather_remote_data_source.dart';
import 'package:weather_app/forecast/data/models/failure.dart';
import 'package:weather_app/forecast/data/models/server_failure.dart';
import 'package:weather_app/forecast/data/models/weather.dart';
import 'package:weather_app/forecast/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  WeatherRepositoryImpl(this.weatherRemoteDataSource);

  @override
  Future<Either<Failure, Weather>> fetchWeather() async {
    try {
      final response= await weatherRemoteDataSource.fetchWeather();
      return Right(response);
    }
    catch (error){
      return Left(ServerFailure(''));
    }
  }

}