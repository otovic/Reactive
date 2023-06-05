import 'dart:async';

abstract class Bloc<T> {
  final Stream<T> dataStream = (() {
    late final StreamController<T> controller = StreamController<T>();
    return controller.stream;
  })();

  late final T state;

  Bloc(this.state) {
    assert(T != dynamic, 'T must be a class type!');
  }
}
