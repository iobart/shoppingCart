import 'package:shoppicart/data/bloc/product.bloc.dart';
import 'package:shoppicart/data/models/product_cart_model.dart';
import 'package:shoppicart/presentation/home/shopdetail.bloc.dart';
import 'package:shoppicart/data/models/product_model.dart';
import 'package:shoppicart/data/utilsBloc/bloc_field.dart';
import 'package:shoppicart/data/utilsBloc/bloc_provider.dart';
import 'package:shoppicart/presentation/pages/shopCart/shopCard.page.dart';
import 'package:shoppicart/providers/productos_provider.dart';

class HomeBloc implements BlocBase {
  static HomeBloc? _instance;
  final ShopDetailBloc? blocTotal=ShopDetailBloc();
  final ProductBloc? blocProduct=ProductBloc();
  final productosProvider = new ProductosProvider();
  factory HomeBloc() {
    _instance = new HomeBloc._internal();
    _instance!.init();
    return _instance!;
  }


  init() async {
    var cProductos = await productosProvider.cargarProductos();
    listproduct.sink(cProductos);
    var cargarOrden=await productosProvider.cargarOrden();
    listorden.sink(cargarOrden);
  }

  final currentIndexBottomNavigation = FieldBlocGeneric<int>(defaultValue: 0);
  final listproduct = FieldBlocGeneric<List<ProductoModel>>();
  final listorden = FieldBlocGeneric<List<ProductCartModel>>();


  HomeBloc._internal();

  @override
  void dispose() {
    currentIndexBottomNavigation.dispose();
    listproduct.dispose();
    _instance = null;
  }
}
