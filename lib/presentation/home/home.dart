import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:shoppicart/presentation/home/home.bloc.dart';
import 'package:shoppicart/presentation/home/shopdetail.bloc.dart';
import 'package:shoppicart/presentation/pages/shopCart/shopCard.page.dart';
import 'package:shoppicart/presentation/widgets/appBar.widget.dart';
import 'package:shoppicart/presentation/widgets/listProduct.widget.dart';
import 'package:shoppicart/data/utilsBloc/bloc_provider.dart';

class HomeProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc? blocHome = BlocProvider.ofBloc<HomeBloc>(context);

    return Scaffold(
      appBar: AppWidget(blocTotal:blocHome!.blocTotal!,loadCarrito: blocHome.blocTotal!,),
      bottomNavigationBar: _bottomNav(context,blocHome, actIndex: 0),
      body: _createBody(blocHome),
    );
  }
}

Widget _createBody(blocHome) {
  final widgetsNavigationBottom = <Widget>[
    ListProductComponent(blocProduct:blocHome.listproduct),
    OrderCar()];
  return StreamBuilder(
      stream: blocHome.currentIndexBottomNavigation.stream,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return IndexedStack(
          index: snapshot.hasData ? snapshot.data : 0,
          children: widgetsNavigationBottom,
        );
      });
}

Widget _bottomNav(BuildContext context,blocHome, {required int actIndex }) {
  return StreamBuilder(
    stream:  blocHome.currentIndexBottomNavigation.stream,
    builder: (context,AsyncSnapshot snapshot) {
      return ConvexAppBar(
        top: -20,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.shopping_cart_outlined, title: 'Car'),
        ],//optional, default as 0
        onTap: (int i) {
          blocHome.currentIndexBottomNavigation.sink(i);
        },
      );
    }
  );
}
