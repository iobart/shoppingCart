import 'dart:convert';

import 'package:shoppicart/data/models/product_model.dart';

class ProductCartModel {
  ProductCartModel({
    this.product_id,
    this.cart_id,
    this.producto,
    this.quantity,
  });

  String? product_id;
  String? cart_id;
  int? quantity;
  ProductoModel? producto;

  get totalPrice {
    if(producto!=null){
      return producto!.precio!*quantity!;
    }
    return 0;
  }

  ProductCartModel.fromJson(Map<String, dynamic> json)
      : this(
          product_id: (json['product_id'].toString()),
    cart_id: (json['cart_id'].toString()),
          quantity: (json['quantity']),
        );

  static List<ProductCartModel> decode(String musics) =>
      (json.decode(musics))
          .map<ProductCartModel>((item) => ProductCartModel.fromJson(item))
          .toList();
  Map<String, dynamic> toJson() {
    return {
      "product_id": product_id!,
      "cart_id": cart_id!,
      "quantity": quantity!,
    };
  }
}
