import 'package:flutter/material.dart';
import 'package:reactive/bloc_base.dart';
import './reactive_widget.dart';

void main() {
  runApp(const MyApp());
}

class MainBloc extends Bloc<int> {
  MainBloc(int value) : super(value);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MainBloc blocc = MainBloc(10);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body: ReactiveWidget<int>(
          bloc: blocc,
          widget: const Text("Petar"),
        ),
      ),
    );
  }
}
