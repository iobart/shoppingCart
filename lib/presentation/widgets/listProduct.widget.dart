import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppicart/data/models/product_model.dart';
import 'package:shoppicart/data/utilsBloc/bloc_field.dart';


class ListProductComponent extends StatelessWidget {
const ListProductComponent({required this.blocProduct});
final FieldBlocGeneric<List<ProductoModel>> blocProduct ;
  @override
  Widget build(BuildContext context) {
   // final ListProductBloc? blocProduct = BlocProvider.ofBloc<ListProductBloc>(context);
    return StreamBuilder(
      stream: blocProduct.stream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;

          return ListView.builder(
            padding: EdgeInsets.only(bottom: 30, top: 20),
            itemCount: productos!.length,
            itemBuilder: (context, i) => _createItem(context, productos[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _createItem(
    BuildContext context,
    ProductoModel producto,
  ) {
    return Card(
      shadowColor: Colors.white60,
      elevation: 20,
      child: InkWell(
        onTap: ()=>Navigator.pushNamed(
            context, 'CardDetail',
            arguments: producto),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          width: 150,
          height: 150,
          child: Row(
            children: [
              Flexible(
                  flex: 4,
                  child: Container(
                    child: Image.network(producto.imgURL!),
                  )),
              Flexible(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            producto.nombre!,
                            style: GoogleFonts.ubuntu(fontSize: 18),
                          ),
                        ),
                        Container(
                          child: Text(
                            '\$ ${producto.precio.toString()}',
                            style: GoogleFonts.ubuntu(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
