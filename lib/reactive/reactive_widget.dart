import 'package:flutter/material.dart';

import '../bloc/bloc_base.dart';

class ReactiveWidget<E, T> extends StatelessWidget {
  final Bloc<E, T> bloc;
  final Function builder;

  ReactiveWidget(
      {Key? key, condition, required this.bloc, required this.builder})
      : super(key: key) {
    if (condition != null) {
      this.bloc.setCondition(condition);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.controller.stream,
      initialData: bloc.getCurrentState,
      builder: (BuildContext context, AsyncSnapshot<T> snap) =>
          builder(context, this.bloc, snap.data),
    );
  }
}
