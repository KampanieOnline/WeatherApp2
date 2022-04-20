import 'package:weather_app/common/models/base_state.dart';
import 'package:weather_app/forecast/data/models/weather.dart';

class WeatherInitState extends BaseState {
  WeatherInitState() : super([]);
}

class LoadingWeatherState extends BaseState {
  LoadingWeatherState() : super([]);
}

class LoadedWeatherState extends BaseState {
  LoadedWeatherState(this.weatherResponse) : super([weatherResponse]);
  final Weather weatherResponse;
}

class LoadingLocalWeatherState extends BaseState {
  LoadingLocalWeatherState() : super([]);
}

class LoadedLocalWeatherState extends BaseState {
  LoadedLocalWeatherState(this.weatherResponse) : super([weatherResponse]);
  final Weather weatherResponse;
}