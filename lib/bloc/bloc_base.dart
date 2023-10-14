import '../state/data_controller.dart';
import '../state/state_streamable.dart';

typedef FireEventType<S, E> = void Function(E currentState, S value);

abstract class Bloc<E, T> {
  late Streamable<T> _state;
  late Map<Type, Function> _events = {};
  StreamData<T> _controller = StreamData();

  Bloc(T state) {
    this._state =
        Streamable<T>(currentState: state, stream: _controller.streamSink);
  }

  void emit(T value) {
    this._state.emit(value);
  }

  T? get getPreviousState => _state.previousState;
  T get getCurrentState => _state.currentState;
  Stream<T> get getCurrentStream => _controller.stream;

  void on<H>(void Function(T currentState, H value) event) {
    assert(_isSubtype<H, E>(),
        "Nepodudaran tip eventa! ${H} nije subtip od ${E}!");

    Type eventType = H;

    _events.forEach((key, element) {
      if (key == eventType) {
        throw FormatException("Event ${H} je vec registrovan!");
      }
    });

    _events[eventType] = event;
  }

  bool _isSubtype<Q, W>() => <Q>[] is List<W>;

  void fireEvent<S>(S state) {
    assert(_isSubtype<S, E>(), "Nepodudaran tip eventa! $S nije subtip od $E!");

    Type eventType = S;

    _events.forEach((key, element) {
      if (key == eventType) {
        element(_state.currentState, state);
        return;
      }
    });
  }
}
