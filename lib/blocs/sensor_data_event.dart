import 'package:equatable/equatable.dart';

abstract class SensorDataEvent extends Equatable {
  const SensorDataEvent();

  @override
  List<Object> get props => [];
}

class FetchSensorData extends SensorDataEvent {}
