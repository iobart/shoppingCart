import 'dart:convert';

CartModel productoModelFromJson(String str) =>
    CartModel.fromJson(json.decode(str));

String productoModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({this.id, this.status});

  String? id;
  bool? status;

  CartModel.fromJson(Map<String, dynamic> json)
      : this(
          id: (json['id'].toString()),
          status: (json['status']),
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id!,
      "status": status!,
    };
  }
}
