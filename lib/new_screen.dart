import 'package:flutter/material.dart';
import 'package:reactive/bloc/bloc_provider.dart';
import 'package:reactive/main.dart';
import 'package:reactive/reactive/reactive_widget.dart';

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainBloc bloc = BlocProvider.of<MainBloc>(context);
    print(bloc);
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
