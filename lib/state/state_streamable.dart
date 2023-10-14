import 'dart:async';

class Streamable<T> {
  late T? _previousState;
  late T _currentState;
  late StreamSink<T> stream;

  T get currentState => _currentState;
  T? get previousState => _previousState;

  Streamable({condition, required currentState, required this.stream})
      : this._currentState = currentState;

  void setInitialState(T state) {
    this._currentState = state;
    this._previousState = state;
  }

  void emit(T value) {
    this._previousState = currentState!;
    this._currentState = value;

    stream.add(value);
  }
}
