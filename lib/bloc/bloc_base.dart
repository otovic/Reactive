import 'dart:async';

import '../state/data_controller.dart';
import '../state/state_streamable.dart';

abstract class Bloc<E, T> {
  StreamData<T> controller = StreamData();
  late Streamable<T> _state;
  List<dynamic> events = [];

  Bloc(T state) {
    this._state =
        Streamable<T>(currentState: state, stream: controller.controller);
  }

  void emit(T value) {
    this._state.emit(value);
  }

  T get getCurrentState => _state.currentState;

  void setCondition(Function condition) {
    this._state.setCondition(condition);
  }

  void on<H>(void Function(H value) event) {
    assert(_isSubtype<H, E>(),
        "Nepodudaran tip eventa! ${H} nije subtip od ${E}!");

    Type eventType = H;

    events.forEach((element) {
      if (element[0] == eventType) {
        throw FormatException("Event ${H} je vec registrovan!");
      }
    });

    events.add([eventType, event]);
  }

  bool _isSubtype<Q, W>() => <Q>[] is List<W>;

  void fireEvent<Q>(Q event) {
    assert(_isSubtype<Q, E>(),
        "Nepodudaran tip eventa! ${Q} nije subtip od ${E}!");

    Type eventType = Q;

    events.forEach((element) {
      if (element[0] == eventType) {
        element[1](event);
      }

      return;
    });
  }
}
