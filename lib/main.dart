import 'package:flutter/material.dart';
import 'package:reactive/bloc/bloc_base.dart';
import 'package:reactive/bloc/bloc_provider.dart';
import 'package:reactive/new_screen.dart';
import 'reactive/reactive_widget.dart';

void main() {
  runApp(MyApp());
}

class MainBloc extends Bloc<int> {
  MainBloc(int value) : super(value);

  void newVal(int value) {
    add(value);
  }
}

class MyApp extends StatelessWidget {
  final MainBloc blocc = MainBloc(10);
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      bloc: blocc,
      child: MaterialApp(
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
            condition: (int prev, int curr) {
              print(prev);
              if (curr + curr > prev) {
                return true;
              }
              return false;
            },
            builder: (BuildContext context, int? state) {
              return Column(
                children: [
                  Text(
                    state.toString(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      blocc.add(state == null ? 0 : state + 10);
                    },
                    child: Text("Dodaj"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NewScreen()));
                    },
                    child: Text("Otvori"),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
