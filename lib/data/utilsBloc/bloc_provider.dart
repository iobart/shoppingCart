import 'package:flutter/material.dart';

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({Key? key, @required this.child, this.bloc, this.blocs})
      : assert(child != null),
        super(key: key);

  final T? bloc;
  final Widget? child;
  final List<dynamic>? blocs;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T? ofBloc<T extends BlocBase>(BuildContext context) {
    BlocProvider<T>? provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider?.bloc;
  }

  static R ofBlocs<T extends BlocBase, R extends BlocBase>(
      BuildContext context) {
    BlocProvider<T>? provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    R? bloc = provider?.blocs?[provider.blocs!.indexWhere((bloc) => bloc is R)];
    if (bloc == null) {
      throw FlutterError(
          'BlocProvider.ofBlocs() called with a context that does not contain a Bloc of type $T.\n'
          'No $T ancestor could be found starting from the context that was passed '
          'to BlocProvider.ofBlocs(). This can happen '
          'if the context you use comes from a widget above your Bloc.\n'
          'The context used was:\n'
          '  $context');
    }
    return bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    if (widget.blocs != null) {
      for (var item in widget.blocs!) {
        item?.dispose();
      }
    }
    widget.bloc?.dispose();
    print('CLEAN MEMORY ${widget.child.runtimeType.toString()}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }
}

abstract class BlocBase {
  void dispose();
}

abstract class ServiceBase {
  void dispose();
}
