import 'dart:async';
import 'package:flutter/material.dart';

import '../bloc/bloc_base.dart';
import '../state/data_controller.dart';

class ReactiveWidget<E, S> extends StatefulWidget {
  final Bloc<E, S> _bloc;
  final Function _builder;
  final Function? _condition;
  final Function? observer;
  final dynamic value;
  StreamData<S> _stream = StreamData();
  late StreamSubscription<S> _subscription;

  ReactiveWidget(
      {Key? key,
      required bloc,
      required builder,
      condition,
      value,
      context,
      observer})
      : this._condition = condition,
        this._bloc = bloc,
        this._builder = builder,
        this.observer = observer,
        this.value = value,
        super(key: key) {
    _stream.streamSink.add(_bloc.getCurrentState);
    _subscription = bloc.getCurrentStream.listen((newState) {
      _emit(bloc.getPreviousState, newState);
    });
  }

  void _emit(S? previousState, S currentState) {
    if (observer != null) {
      observer!(currentState, value);
    } else {
      if (_condition != null) {
        if (_condition!(previousState, currentState) == true) {
          _stream.streamSink.add(currentState);
        }
      } else {
        _stream.streamSink.add(currentState);
      }
    }
  }

  @override
  State<ReactiveWidget> createState() => _State<S>();
}

class _State<Z> extends State<ReactiveWidget> {
  @override
  void dispose() {
    widget._subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("PRAVIM");
    return StreamBuilder<Z>(
      stream: widget._stream.stream as Stream<Z>,
      initialData: widget._bloc.getCurrentState,
      builder: (context, snap) =>
          widget._builder(context, widget._bloc, snap.data),
    );
  }
}
