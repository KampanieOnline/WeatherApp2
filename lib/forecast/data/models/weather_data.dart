import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/forecast/data/models/weather_main.dart';
import 'package:weather_app/forecast/data/models/weather_state.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  WeatherData(this.main, this.state);

  final WeatherMain main;
  @JsonKey(name: 'weather')
  final WeatherState state;

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}
