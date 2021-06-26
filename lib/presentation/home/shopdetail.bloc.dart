import 'package:shoppicart/data/utilsBloc/bloc_field.dart';
import 'package:shoppicart/data/utilsBloc/bloc_provider.dart';
import 'package:shoppicart/providers/productos_provider.dart';

class ShopDetailBloc implements BlocBase {
  static ShopDetailBloc? _instance;
  final productosProvider = new ProductosProvider();
  factory ShopDetailBloc() {
    _instance = new ShopDetailBloc._internal();

    _instance!.init();
    return _instance!;
  }

  init() async {
    var loadCarrito =await productosProvider.cargarCarrito();
    estadoCarrito.sink(loadCarrito);
  }


  final total = FieldBlocGeneric<int>(defaultValue: 0);
  final estadoCarrito = FieldBlocGeneric<bool>();

  ShopDetailBloc._internal();

  @override
  void dispose() {
    total.dispose();
    estadoCarrito.dispose();
    _instance=null;
  }
}
