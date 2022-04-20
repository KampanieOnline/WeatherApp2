import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  final List<Object?> properties;

  BaseState(this.properties);

  @override
  List<Object?> get props => properties;
}
