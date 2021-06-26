// import 'dart:convert';

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

ProductoModel productoModelFromJson(String str) =>
    ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  ProductoModel(
      {this.id,
      this.nombre,
      this.descripcion,
      this.precio,
      this.sku,
      this.imgURL});

  String? id;
  String? imgURL;
  String? nombre;
  String? descripcion;
  int? precio;
  String? sku;

  ProductoModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    nombre = doc["nombre"];
    descripcion = doc["descripcion"];
    precio = doc["precio"];
    sku = doc["sku"];
    imgURL = doc["imgURL"];
  }

  ProductoModel.fromJson(Map<String, dynamic> json)
      : this(
            id: (json['id'].toString()),
            nombre: (json['nombre'].toString()),
            precio: (json['precio']),
            descripcion: (json['descripcion'].toString()),
            sku: (json['sku'].toString()),
            imgURL: (json['imgURL'].toString()));

  Map<String, Object> toJson() {
    return {
      'id': id!,
      'nombre': nombre!,
      'precio': precio!,
      'descripcion': descripcion!,
      'sku': sku!,
      'imgURL': imgURL!
    };
  }
}
