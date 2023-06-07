import 'package:flutter/material.dart';
import 'package:reactive/bloc/bloc_base.dart';
import 'package:reactive/reactive/reactive_widget.dart';

class NewScreen extends StatelessWidget {
  final Bloc<int> bloc;
  const NewScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveWidget(
      bloc: bloc,
      builder: (BuildContext context, int? state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.toString()),
          ),
        );
      },
    );
  }
}
