import 'package:flutter/cupertino.dart';

import 'bloc_base.dart';

class BlocProvider<T> extends InheritedWidget {
  late T bloc;

  BlocProvider({Key? key, required Widget child, required this.bloc})
      : super(key: key, child: child);

  static T of<T extends Bloc<dynamic, dynamic>>(BuildContext context) {
    T bloc =
        context.dependOnInheritedWidgetOfExactType<BlocProvider<T>>()!.bloc;
    assert(bloc != null, "Nije pronadjen bloc tipa $T");
    return bloc;
  }

  @override
  bool updateShouldNotify(BlocProvider<T> oldWidget) {
    return true;
  }
}
