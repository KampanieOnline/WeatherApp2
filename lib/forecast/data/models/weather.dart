import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Weather(
    this.temp,
    this.day,
    this.pressure,
    this.state,
  );

  final String temp;
  @JsonKey(name: 'date')
  final String day;
  final String pressure;
  final String state;

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
