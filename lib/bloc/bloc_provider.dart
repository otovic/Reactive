import 'package:flutter/cupertino.dart';
import 'package:reactive/bloc/bloc_base.dart';
import 'package:reactive/reactive/reactive_widget.dart';

class BlocProvider<T> extends InheritedWidget {
  late T bloc;

  BlocProvider({Key? key, required Widget child, required this.bloc})
      : super(key: key, child: child);

  static T of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider<T>>()!.bloc;
  }

  @override
  bool updateShouldNotify(BlocProvider<T> oldWidget) {
    return bloc != oldWidget.bloc;
  }
}
