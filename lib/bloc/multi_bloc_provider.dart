import 'package:flutter/cupertino.dart';
import 'package:reactive/bloc/provider_type.dart';

import 'bloc_base.dart';

class MultiBlocProvider<I extends ProviderType> extends InheritedWidget {
  late Map<Type, Bloc> blocs;

  MultiBlocProvider({Key? key, required this.blocs, required Widget child})
      : super(key: key, child: child);

  static B of<I extends ProviderType, B extends Bloc<dynamic, dynamic>>(
      BuildContext context) {
    MultiBlocProvider<I>? provider =
        context.dependOnInheritedWidgetOfExactType<MultiBlocProvider<I>>();

    if (provider == null) {
      throw Exception(
          "Nije pronadjen odgovarajuci MultiBlocProvider<$I> => je null!");
    }

    return (provider.blocs[B]) as B;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
