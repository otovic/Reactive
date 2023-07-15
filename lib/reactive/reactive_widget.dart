import 'package:flutter/material.dart';
import 'package:reactive/bloc/bloc_base.dart';

class ReactiveWidget<T> extends StatelessWidget {
  final Bloc<T> bloc;
  final Function builder;
  final Function? condition;

  ReactiveWidget(
      {Key? key, this.condition, required this.bloc, required this.builder})
      : super(key: key) {
    if (this.condition != null) this.bloc.setCondition(this.condition!);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.stream,
      initialData: bloc.state,
      builder: (BuildContext context, AsyncSnapshot<T> snap) =>
          builder(context, snap.data),
    );
  }
}
