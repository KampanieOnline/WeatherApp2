import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/models/base_bloc.dart';
import 'package:weather_app/common/models/base_event.dart';
import 'package:weather_app/common/models/base_state.dart';
import 'package:weather_app/common/models/error_state.dart';
import 'package:weather_app/forecast/bloc/weather_event.dart';
import 'package:weather_app/forecast/bloc/weather_state.dart';
import 'package:weather_app/forecast/domain/usecases/get_local_weather_usecase.dart';
import 'package:weather_app/forecast/domain/usecases/get_temprorary_weather_usecase.dart';
import 'package:weather_app/forecast/domain/usecases/get_weather_usecase.dart';

class WeatherBloc extends BaseBloc<BaseEvent, BaseState> {
  WeatherBloc(
    this.getWeatherUsecase,
    this.getLocalWeatherUsecase,
    this.getTemproraryWeatherUsecase,
  ) : super(WeatherInitState()) {
    on<GetWeatherEvent>(onGetWeatherEvent);
    on<GetLocalWeatherEvent>(onGetLocalWeatherEvent);
    on<GetTemproraryWeatherEvent>(onGetTemproraryWeatherEvent);
  }

  final GetWeatherUsecase getWeatherUsecase;
  final GetLocalWeatherUsecase getLocalWeatherUsecase;
  final GetTemporaryWeatherUsecase getTemproraryWeatherUsecase;

  void onGetWeatherEvent(GetWeatherEvent event, Emitter<BaseState> emit) async {
    emit(LoadingWeatherState());

    final response = await getWeatherUsecase();

    response.fold(
      (failure) => emit(ErrorState()),
      (weather) => emit(LoadedWeatherState(weather)),
    );
  }

  void onGetLocalWeatherEvent(
      GetLocalWeatherEvent event, Emitter<BaseState> emit) {
    emit(LoadingLocalWeatherState());
    final response = getLocalWeatherUsecase();
    emit(LoadedLocalWeatherState(response));
  }

  void onGetTemproraryWeatherEvent(
      GetTemproraryWeatherEvent event, Emitter<BaseState> emit) async {
    emit(LoadingTemproraryWeatherState());
    final response = await getTemproraryWeatherUsecase();
    response.fold(
      (failure) => emit(ErrorState()),
      (weather) => emit(LoadedTemproraryWeatherState(weather)),
    );
  }
}
