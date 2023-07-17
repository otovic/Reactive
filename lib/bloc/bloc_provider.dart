import 'package:flutter/cupertino.dart';

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
