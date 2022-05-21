import 'package:json_annotation/json_annotation.dart';

part 'weather_main.g.dart';

@JsonSerializable()
class WeatherMain {
  WeatherMain(
      this.temp,
      this.humidity,
      this.pressure,
      );

  final double temp;
  final double humidity;
  final double pressure;

  Map<String, dynamic> toJson() => _$WeatherMainToJson(this);

  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainFromJson(json);
}