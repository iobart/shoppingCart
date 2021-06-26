import 'package:shoppicart/data/models/product_model.dart';

class PedidoList {
  static final PedidoList _PedidoList = PedidoList._internal();

  List<ProductoModel> listProducts = [];

  factory PedidoList() => _PedidoList;

  static PedidoList get instance => PedidoList();

  PedidoList._internal();
}
