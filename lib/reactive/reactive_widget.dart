import 'package:flutter/material.dart';
import 'package:reactive/bloc/bloc_base.dart';

class ReactiveWidget<T> extends StatelessWidget {
  final Bloc<T> bloc;
  final Function builder;

  ReactiveWidget(
      {Key? key, condition, required this.bloc, required this.builder})
      : super(key: key) {
    if (condition != null) {
      this.bloc.state.setCondition(condition);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.controller.stream,
      initialData: bloc.state.currentState,
      builder: (BuildContext context, AsyncSnapshot<T> snap) =>
          builder(context, this.bloc, snap.data),
    );
  }
}
