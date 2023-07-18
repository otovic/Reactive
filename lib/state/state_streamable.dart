import 'dart:async';

class Streamable<T> {
  late T? previousState;
  late T currentState;
  late Function? _condition;
  late StreamController<T> stream;

  Streamable({condition, required this.currentState, required this.stream}) {
    this._condition = condition;
  }

  void setCondition(Function condition) {
    this._condition = condition;
  }

  void setInitialState(T state) {
    this.currentState = state;
    this.previousState = state;
  }

  void emit(T value) {
    this.previousState = currentState!;
    this.currentState = value;

    if (this._condition != null) {
      if (this.previousState != null) {
        if (this._condition!(this.previousState, this.currentState) == true) {
          stream.sink.add(value);
          return;
        }
        return;
      }
      stream.sink.add(value);
    } else {
      stream.sink.add(value);
    }
  }
}
