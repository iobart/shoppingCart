import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shoppicart/presentation/home/home.bloc.dart';
import 'package:shoppicart/presentation/home/shopdetail.bloc.dart';

class AppWidget extends StatelessWidget implements PreferredSizeWidget {
 const AppWidget({  required this.blocTotal,required this.loadCarrito});
 final ShopDetailBloc loadCarrito ;
final ShopDetailBloc blocTotal;
  @override
  Size get preferredSize => const Size.fromHeight(60);

  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize:preferredSize ,
      child: AppBar(
        title: Text('Shoppeing'),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: StreamBuilder(
              stream: blocTotal.total.stream,
              builder: (context,AsyncSnapshot<int> snapshot) {
                return Text(
                 snapshot.hasData?snapshot.data.toString():0.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 10),
                );
              }
            ),
            child: IconButton(
                tooltip: 'Carrito compras',
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () => Navigator.pushNamed(context, "Car")),
          )
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.blue,
      ),
    );
  }

}
