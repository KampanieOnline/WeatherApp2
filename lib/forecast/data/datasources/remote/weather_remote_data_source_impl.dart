import 'package:chopper/chopper.dart';
import 'package:weather_app/common/api/api_service.dart';
import 'package:weather_app/forecast/data/datasources/remote/weather_remote_data_source.dart';
import 'package:weather_app/forecast/data/models/weather_data.dart';

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final ApiService apiService;

  WeatherRemoteDataSourceImpl(this.apiService);

  @override
  Future<WeatherData> fetchWeather() async {
    final response = await apiService.getWeather('');
    return response.body!;
  }
}
