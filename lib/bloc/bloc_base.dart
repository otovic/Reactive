import 'dart:async';

abstract class Bloc<T> {
  final StreamController<T> _controller = StreamController<T>.broadcast();
  StreamSink<T> get streamSink => _controller.sink;
  Stream<T> get stream => _controller.stream;
  Function? _condition;

  late T state;

  Bloc(this.state) {
    streamSink.add(this.state);
  }

  void setCondition(Function condition) {
    this._condition = condition;
  }

  void add(T value) async {
    if (this._condition != null) {
      if (this._condition == true) streamSink.add(value);
    } else {
      streamSink.add(value);
    }
    state = value;
  }
}
