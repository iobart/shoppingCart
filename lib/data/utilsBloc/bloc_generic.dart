import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'bloc_provider.dart';

class Bloc<T>  implements BlocBase {
  final _controllerMap = BehaviorSubject<Map<dynamic, dynamic>>();

  final controller = BehaviorSubject<T>();
  final T? init;

  Bloc({ this.init}) {
    if (init != null) {
      this.sink(init!);
    }
  }
  Stream<T> get stream => controller.stream;
  Function(T) get sink => controller.sink.add;
  T? get value => controller.value;

  Function(Map<dynamic, dynamic>) get mapSink => _controllerMap.sink.add;
  Map<dynamic, dynamic>? get mapValue => _controllerMap.value;
  Stream<Map<dynamic, dynamic>> get mapStream => _controllerMap.stream;

  @override
  dispose() {
    controller.close();
    _controllerMap.close();
  }
}
