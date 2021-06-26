import 'package:flutter/material.dart';

class OrderCar extends StatelessWidget {
  const OrderCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder
      (
        itemCount: 0,
        itemBuilder: (BuildContext ctxt, int index) {
          return ListTile(
            title: new Text("Rating #"),
            subtitle: new Text("fields[index].title"),
          );
        }
    ) ;
  }
}
