import 'package:weather_app/forecast/data/datasources/remote/weather_remote_data_source.dart';
import 'package:weather_app/forecast/data/models/weather.dart';

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  @override
  Future<Weather> fetchWeather() => Future.value(
        Weather('21', 'monday', '1005hPa'),
      );
}
