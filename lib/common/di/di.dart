import 'package:get_it/get_it.dart';
import 'package:weather_app/common/api/api_service.dart';
import 'package:weather_app/forecast/bloc/weather_bloc.dart';
import 'package:weather_app/forecast/data/datasources/local/weather_local_data_source.dart';
import 'package:weather_app/forecast/data/datasources/local/weather_local_data_source_impl.dart';
import 'package:weather_app/forecast/data/datasources/remote/weather_remote_data_source.dart';
import 'package:weather_app/forecast/data/datasources/remote/weather_remote_data_source_impl.dart';
import 'package:weather_app/forecast/data/repository/weather_repository_impl.dart';
import 'package:weather_app/forecast/domain/repository/weather_repository.dart';
import 'package:weather_app/forecast/domain/usecases/get_local_weather_usecase.dart';
import 'package:weather_app/forecast/domain/usecases/get_temprorary_weather_usecase.dart';
import 'package:weather_app/forecast/domain/usecases/get_weather_usecase.dart';

final serviceLocator = GetIt.instance;

Future initServiceLocator() async {
  final apiClient = await ApiService.create();
  serviceLocator.registerLazySingleton(() => apiClient);
  serviceLocator.registerFactory<WeatherBloc>(
    () => WeatherBloc(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(() => GetWeatherUsecase(serviceLocator()));
  serviceLocator
      .registerFactory(() => GetLocalWeatherUsecase(serviceLocator()));
  serviceLocator.registerFactory<WeatherRepository>(
      () => WeatherRepositoryImpl(serviceLocator(), serviceLocator()));
  serviceLocator.registerFactory<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<WeatherLocalDataSource>(
      () => WeatherLocalDataSourceImpl());
  serviceLocator
      .registerFactory(() => GetTemporaryWeatherUsecase(serviceLocator()));
}
