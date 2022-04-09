import 'package:weather_app/forecast/data/models/failure.dart';

class ServerFailure extends Failure{
  ServerFailure(this.code) : super([code]);
  final String? code;
}