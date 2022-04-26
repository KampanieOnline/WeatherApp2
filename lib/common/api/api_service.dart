import 'package:chopper/chopper.dart';
import 'package:weather_app/common/api/json_to_type_converter.dart';
import 'package:weather_app/forecast/data/models/weather.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Get(path: 'linkDoStrony.com')
  Future<Response<Weather>> getWeather(@Query('location') String location);

  _$ApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://aplikacjapogodowa.pl/',
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: jsonToTypeConverter(),
      errorConverter: jsonToTypeConverter(),
      services: [_$ApiService()],
    );
    return _$ApiService(client);
  }

  JsonToTypeConverter jsonToTypeConverter() => JsonToTypeConverter({
        Weather: (jsonData) => Weather.fromJson(jsonData),
      });
}
