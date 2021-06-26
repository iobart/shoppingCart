import 'package:flutter/material.dart';
import 'package:shoppicart/data/models/product_model.dart';
import 'package:shoppicart/data/utilsBloc/bloc_provider.dart';
import 'package:shoppicart/presentation/home/home.bloc.dart';
import 'package:shoppicart/presentation/widgets/appBar.widget.dart';
import 'package:shoppicart/presentation/widgets/stepper.widget.dart';

class CardDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc? bloc = BlocProvider.ofBloc<HomeBloc>(context);
    final args = ModalRoute.of(context)!.settings.arguments as ProductoModel;
    bloc!.blocProduct!.onViewInit(args);
    return Scaffold(
      appBar: AppWidget(blocTotal:bloc.blocTotal!, loadCarrito: bloc.blocTotal!,),
      body: ListView(padding: EdgeInsets.only(bottom: 20, top: 50), children: [
        Center(
          /** Card Widget **/
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.orangeAccent[400],
                      radius: 104,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(args.imgURL!),
                        //NetworkImage
                        backgroundColor: Colors.white,
                        radius: 100,
                      ), //CircleAvatar
                    ), //CirclAvatar
                    SizedBox(
                      height: 10,
                    ), //SizedBox
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        args.nombre!,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ), //Textstyle
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        args.descripcion!,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ), //Textstyle
                      ),
                    ),
                    StreamBuilder(
                        stream: bloc.blocProduct!.precioTotal.stream,
                        builder: (context, AsyncSnapshot<int> snapshot) {
                          if (!snapshot.hasData) return Container();
                          return Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              '\$ ${snapshot.data!}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ), //Textstyle
                            ),
                          );
                        }),
                    CustomStepper(
                        iconSize: 30,
                        lowerLimit: 0,
                        stepValue: 1,
                        upperLimit: 10,
                        sink: bloc.blocProduct!.cantidadStep.sink,
                        stream:bloc.blocProduct!.cantidadStep.stream),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.lightBlue,
                          ),),
                      child: Text("Agregar",style: TextStyle(color: Colors.white)),
                      onPressed: () {
                      // PedidoList.instance.listProducts =args.;
                      },
                    )
                  ],
                ), //Column
              ),
            ), //SizedBox
          ), //Card
        ), //Center
      ]),
    );
  }
}
