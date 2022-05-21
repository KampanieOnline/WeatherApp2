import 'package:chopper/chopper.dart';
import 'package:weather_app/common/api/json_to_type_converter.dart';
import 'package:weather_app/forecast/data/models/weather_data.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Get(
      path:
          'https://api.openweathermap.org/data/2.5/weather?lat=52&lon=21&units=metric&appid=4a25591994dbbcc451b1e6d3b05bf37f')
  Future<Response<WeatherData>> getWeather(@Query('location') String location);

  static Future<ApiService> create() async {
    final client = ChopperClient(
      baseUrl: '',
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: jsonToTypeConverter(),
      errorConverter: jsonToTypeConverter(),
      services: [_$ApiService()],
    );
    return _$ApiService(client);
  }

  static JsonToTypeConverter jsonToTypeConverter() => JsonToTypeConverter({
        WeatherData: (jsonData) => WeatherData.fromJson(jsonData),
      });
}
