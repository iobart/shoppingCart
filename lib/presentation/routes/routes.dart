import 'package:flutter/cupertino.dart';
import 'package:shoppicart/presentation/home/home.bloc.dart';
import 'package:shoppicart/data/bloc/product.bloc.dart';
import 'package:shoppicart/presentation/home/shopdetail.bloc.dart';
import 'package:shoppicart/data/utilsBloc/bloc_provider.dart';
import 'package:shoppicart/presentation/home/home.dart';
import 'package:shoppicart/presentation/home/detailCard.page.dart';
import 'package:shoppicart/presentation/pages/shopCart/shopCard.page.dart';

class Routes{
static getRoutes({BuildContext? context}){
  return{
    'CardDetail': (BuildContext context) =>BlocProvider<HomeBloc>(child: CardDetail(),bloc: HomeBloc(),),
    'CarShop':(BuildContext context) =>BlocProvider<ShopDetailBloc>(child: OrderCar(),bloc: ShopDetailBloc(),),
    'home':(BuildContext context) =>BlocProvider<HomeBloc>(child:HomeProducts(),bloc: HomeBloc())
  };
}
}
