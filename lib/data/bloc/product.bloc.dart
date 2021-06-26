import 'package:shoppicart/presentation/home/shopdetail.bloc.dart';
import 'package:shoppicart/data/models/product_model.dart';
import 'package:shoppicart/data/utilsBloc/bloc_field.dart';
import 'package:shoppicart/data/utilsBloc/bloc_provider.dart';

class ProductBloc implements BlocBase {
  static ProductBloc? _instance;
  final ShopDetailBloc? blocTotal=ShopDetailBloc();
  factory ProductBloc() {
    _instance = new ProductBloc._internal();
    _instance!.init();
    return _instance!;
  }

  init() {

    cantidadStep.stream!.listen((event) {
      if(event!=null && precio.value!=null){
        precioTotal.sink(cantidadStep.value!*precio.value!);
      }
    });
  }

  onViewInit(ProductoModel args) {
    if(!firstLoad.value!){
      nombre.sink(args.nombre);
      imgURL.sink(args.imgURL);
      descripcion.sink(args.descripcion);
      precio.sink(args.precio);
      sku.sink(args.sku);
      precioTotal.sink(precio.value);
    }
  }


  //final id =FieldBlocGeneric<int>();

  final nombre =FieldBlocGeneric<String>();
  final imgURL =FieldBlocGeneric<String>();
  final descripcion =FieldBlocGeneric<String>();
  final precio =FieldBlocGeneric<int>();
  final sku =FieldBlocGeneric<String>();
  final cantidadStep=FieldBlocGeneric<int>(defaultValue: 1);
  final precioTotal=FieldBlocGeneric<int>();
  final firstLoad=FieldBlocGeneric<bool>(defaultValue: false);

  ProductBloc._internal();

  @override
  void dispose() {
    nombre.dispose();
    imgURL.dispose();
    descripcion.dispose();
    precio.dispose();
    sku.dispose();
    cantidadStep.dispose();
    precioTotal.dispose();
  }
}
