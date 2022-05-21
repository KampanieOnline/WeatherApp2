// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<WeatherData>> getWeather(String location) {
    final $url =
        'https://api.openweathermap.org/data/2.5/weather?lat=52&lon=21&units=metric&appid=4a25591994dbbcc451b1e6d3b05bf37f';
    final $params = <String, dynamic>{'location': location};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<WeatherData, WeatherData>($request);
  }
}
