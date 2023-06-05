import 'package:flutter/material.dart';
import 'package:reactive/bloc_base.dart';

class ReactiveWidget<S> extends StatelessWidget {
  final Widget widget;
  final Bloc<S> bloc;
  final Function builder;

  const ReactiveWidget({
    super.key,
    required this.bloc,
    required this.widget,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<S>(
      stream: bloc.dataStream,
      builder: (BuildContext context, AsyncSnapshot<S> snapshot) {
        return widget;
      },
    );
  }
}
