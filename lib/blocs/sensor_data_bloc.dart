import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'sensor_data_event.dart';
import 'sensor_data_state.dart';

class SensorDataBloc extends Bloc<SensorDataEvent, SensorDataState> {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();
  StreamSubscription<DatabaseEvent>? _subscription;

  SensorDataBloc() : super(SensorDataInitial()) {
    on<FetchSensorData>(_onFetchSensorData);
  }

  void _onFetchSensorData(
      FetchSensorData event, Emitter<SensorDataState> emit) {
    emit(SensorDataLoading());

    _subscription?.cancel();
    _subscription = _databaseRef.onValue.listen(
      (event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          emit(SensorDataLoaded(Map<String, dynamic>.from(data)));
        } else {
          emit(SensorDataError('Failed to load data.'));
        }
      },
      onError: (error) {
        emit(SensorDataError('Failed to load data: $error'));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
