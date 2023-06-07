import 'dart:async';

abstract class Bloc<T> {
  final StreamController<T> _controller = StreamController<T>.broadcast();
  StreamSink<T> get streamSink => _controller.sink;
  Stream<T> get stream => _controller.stream;

  late T state;

  Bloc(this.state) {
    streamSink.add(this.state);
  }

  void add(T value) async {
    streamSink.add(value);
    state = value;
  }
}
