import 'package:json_annotation/json_annotation.dart';

part 'weather_state.g.dart';

@JsonSerializable()
class WeatherState {
  WeatherState(
      this.description
      );

  final String description;

  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);
}