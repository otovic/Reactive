import 'dart:async';

import 'package:reactive/state/state_streamable.dart';

abstract class Bloc<T> {
  final StreamController<T> _controller = StreamController<T>.broadcast();
  StreamSink<T> get streamSink => _controller.sink;
  Stream<T> get stream => _controller.stream;

  late Streamable<T> state;

  Bloc(T state) {
    this.state = Streamable<T>(currentState: state, stream: this._controller);
  }

  void emit(T value) {
    this.state.emit(value);
  }
}
