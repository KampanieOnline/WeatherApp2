// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      WeatherMain.fromJson(json['main'] as Map<String, dynamic>),
      WeatherState.fromJson(json['weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'main': instance.main,
      'weather': instance.state,
    };
