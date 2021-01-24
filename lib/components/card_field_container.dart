import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class CardFieldContainer extends StatelessWidget {
  final Widget child;
  final double leftT;
  const CardFieldContainer({Key key, this.child, this.leftT}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(left: leftT, top: 10, bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: size.width * 0.3,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(29),
          ),
          child: child,
        ));
  }
}
