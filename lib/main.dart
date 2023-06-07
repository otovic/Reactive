import 'package:flutter/material.dart';
import 'package:reactive/bloc/bloc_base.dart';
import 'package:reactive/new_screen.dart';
import 'reactive/reactive_widget.dart';

void main() {
  runApp(const MyApp());
}

class MainBloc extends Bloc<int> {
  MainBloc(int value) : super(value);

  void newVal(int value) {
    add(value);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MainBloc blocc = MainBloc(10);
    int a = 10;

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
          builder: (BuildContext context, int? state) {
            print(state);
            return Column(
              children: [
                Text(
                  state.toString(),
                ),
                ElevatedButton(
                  onPressed: () {
                    blocc.add(a + 10);
                    a += 10;
                  },
                  child: Text("Dodaj"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewScreen(bloc: blocc)));
                  },
                  child: Text("Otvori"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
