import "dart:async";

class DataController<T> {
  final StreamController<T> controller = StreamController<T>.broadcast();
  StreamSink<T> get streamSink => controller.sink;
  Stream<T> get stream => controller.stream;
}
