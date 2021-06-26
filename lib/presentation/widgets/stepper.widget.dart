import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  CustomStepper({
    @required this.lowerLimit,
    @required this.upperLimit,
    @required this.stepValue,
    @required this.iconSize,
    @required this.sink,
    @required this.stream
  });

  final int? lowerLimit;
  final int? upperLimit;
  final int? stepValue;
  final double? iconSize;
  final Function? sink;
  final Stream<int>? stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context,AsyncSnapshot<int> snapshot) {
        if(!snapshot.hasData) return Container();
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedIconButton(
              icon: Icons.remove,
              iconSize: iconSize!,
              onPress: () {
                if(snapshot.data!>1){
                  final value=snapshot.data!-1;
                  sink!(value);
                }
              },
            ),
            Container(
              width: iconSize,
              child: Text(
                '${snapshot.data}',
                style: TextStyle(
                  fontSize: iconSize! * 0.8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            RoundedIconButton(
              icon: Icons.add,
              iconSize: iconSize!,
              onPress: () {
                final value=snapshot.data!+1;
                sink!(value);
              },
            ),
          ],
        );
      }
    );
  }
}
class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({@required this.icon, @required this.onPress, @required this.iconSize});

  final IconData? icon;
  final Function? onPress;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      elevation: 6.0,
      onPressed: (){
        onPress!();
        },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(iconSize!*0.2)),
      fillColor: Colors.lightBlue,
      child: Icon(
        icon,
        color: Colors.white,
        size: iconSize! * 0.8,
      ),
    );
  }
}