import 'dart:async';
import 'bloc_generic.dart';

class FieldBlocGeneric<T> {
  FieldBlocGeneric({this.defaultValue}) {
    initBloc();
  }

  get type => T;
  Bloc<T>? _bloc;
  final dynamic? defaultValue;

  void initBloc() => _bloc = Bloc<T>( init: defaultValue);
  Bloc<T>? get bloc {
    if (_bloc == null) {
      _bloc = Bloc<T>( init: defaultValue);
    }
    return _bloc;
  }

  T? get value {
    if (_bloc != null) {
      return _bloc?.value;
    }
    return null;
  }

  set sink(v) {
    bloc?.sink(v);
  }

  Stream<T>? get stream {
    return bloc?.stream;
  }

  get sink {
    return bloc?.sink;
  }

  void dispose() {
    bloc?.dispose();
    _bloc?.dispose();
  }

  @override
  String toString() {
    return "${this.type}  = ${this.bloc?.value};";
  }
}
