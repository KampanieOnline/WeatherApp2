import 'package:weather_app/forecast/data/datasources/local/weather_local_data_source.dart';
import 'package:weather_app/forecast/data/models/weather_data.dart';
import 'package:weather_app/forecast/data/models/weather_main.dart';
import 'package:weather_app/forecast/data/models/weather_state.dart';

class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  @override
  void cacheWeather(WeatherData weather) {}

  @override
  WeatherData getWeather() {
    return WeatherData(
      WeatherMain(26, 123, 500),
      WeatherState('pochmurnie'),
    );
  }
}
