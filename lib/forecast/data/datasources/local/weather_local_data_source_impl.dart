import 'package:weather_app/forecast/data/datasources/local/weather_local_data_source.dart';
import 'package:weather_app/forecast/data/models/weather.dart';

class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  @override
  void cacheWeather(Weather weather) {}

  @override
  Weather getWeather(){
    return Weather('21', 'monday', '1005hPa','cloudly');
  }
}
