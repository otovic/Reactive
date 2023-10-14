import "dart:async";

class StreamData<T> {
  final StreamController<T> _controller = StreamController<T>.broadcast();
  StreamSink<T> get streamSink => _controller.sink;
  Stream<T> get stream => _controller.stream;
}
