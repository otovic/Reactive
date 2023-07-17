import 'dart:async';

abstract class Bloc<T> {
  final StreamController<T> _controller = StreamController<T>.broadcast();
  StreamSink<T> get streamSink => _controller.sink;
  Stream<T> get stream => _controller.stream;
  Function? _condition;

  T? previousState = null;
  late T currentState;

  Bloc(T state) {
    this.currentState = state;
  }

  void setCondition(Function condition) {
    this._condition = condition;
  }

  void add(T value) async {
    this.previousState = currentState!;
    this.currentState = value;

    print(this.currentState);

    if (this._condition != null) {
      if (this.previousState != null) {
        if (this._condition!(this.previousState, this.currentState) == true) {
          streamSink.add(value);
          return;
        }
        return;
      }
      streamSink.add(value);
    } else {
      streamSink.add(value);
    }
  }
}
