import 'dart:async';

import 'package:reactive/state/data_controller.dart';
import 'package:reactive/state/state_streamable.dart';

abstract class Bloc<T> {
  DataController<T> controller = DataController();
  late Streamable<T> state;

  Bloc(T state) {
    this.state =
        Streamable<T>(currentState: state, stream: controller.controller);
  }

  void emit(T value) {
    this.state.emit(value);
  }
}
