import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoppicart/data/models/cart_model.dart';
import 'package:shoppicart/data/models/product_cart_model.dart';
import 'package:shoppicart/data/models/product_model.dart';

class ProductosProvider {
  final String _url = 'https://fluttershop-67c78-default-rtdb.firebaseio.com';

/*  Future<bool> crearProducto(ProductoModel producto) async {
    var url = Uri.https('$_url', '/products.json');

    final resp = await http.post(url, body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }*/

  /*Future<bool> editarProducto(ProductoModel producto) async {
    var url = Uri.https('$_url', '/products.json');

    final resp = await http.put(url, body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }*/
  Future<List<ProductCartModel>> cargarOrden() async {
    //   final url = Uri.https('$_url','/products.json');
    var url = Uri.parse('$_url/Product_carts.json');
    final resp = await http.get(url);


    var user = ProductCartModel.decode(resp.body);
    print(user);
    Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductCartModel> productos = [];

    if (decodedData == null) return [];

    decodedData.forEach((id, prod) {
      try {
        final prodTemp = ProductCartModel.fromJson(prod);
        prodTemp.cart_id = id;

        productos.add(prodTemp);
      } catch (e) {
        print(e);
      }
    });

    // print( productos[0].id );

    return productos;
  }
  Future<List<ProductoModel>> cargarProductos() async {
    //   final url = Uri.https('$_url','/products.json');
    var url = Uri.parse('$_url/products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = [];

    if (decodedData == null) return [];

    decodedData.forEach((id, prod) {
      try {
        final prodTemp = ProductoModel.fromJson(prod);
        prodTemp.id = id;

        productos.add(prodTemp);
      } catch (e) {
        print(e);
      }
    });

    // print( productos[0].id );

    return productos;
  }
  Future<bool> cargarCarrito() async {
    //   final url = Uri.https('$_url','/products.json');
    var url = Uri.parse('$_url/Carts.json');
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    bool Carrito =false;
    //TODO AGREGARLO AL BLOC DE HOME
    if (decodedData == null) return false;

    decodedData.forEach((id, car) {
      try {
        final carTemp = CartModel.fromJson(car);
        carTemp.id = id;
        Carrito=carTemp.status as bool;
        print(Carrito);
      } catch (e) {
        print(e);
      }
    });
    return Carrito;
  }
}
