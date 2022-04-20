import 'package:equatable/equatable.dart';

abstract class BaseEvent extends Equatable {
  final List<Object?> properties;

  BaseEvent(this.properties);

  @override
  List<Object?> get props => properties;
}
