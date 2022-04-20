import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/models/base_event.dart';
import 'package:weather_app/common/models/base_state.dart';

abstract class BaseBloc<Event extends BaseEvent, State extends BaseState>
    extends Bloc<Event, State> {
  BaseBloc(this.initState) : super(initState);

  final State initState;
}

