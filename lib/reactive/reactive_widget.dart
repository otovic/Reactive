import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reactive/bloc/bloc_base.dart';

class ReactiveWidget<S> extends StatefulWidget {
  final Bloc<S> bloc;
  final Function builder;

  const ReactiveWidget({
    Key? key,
    required this.bloc,
    required this.builder,
  }) : super(key: key);

  @override
  _ReactiveWidgetState<S> createState() => _ReactiveWidgetState<S>();
}

class _ReactiveWidgetState<S> extends State<ReactiveWidget<S>> {
  StreamSubscription<S>? _subscription;
  S? _snapshotData;

  @override
  void initState() {
    super.initState();
    _snapshotData = widget.bloc.state;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.bloc.stream,
      initialData: widget.bloc.state,
      builder: (BuildContext context, AsyncSnapshot<S> snap) =>
          widget.builder(context, snap.data),
    );
  }
}
