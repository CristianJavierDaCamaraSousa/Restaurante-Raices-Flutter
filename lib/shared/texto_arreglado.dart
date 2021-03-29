import 'package:flutter/material.dart';

Widget textoArreglado({@required Size size, @required String texto}) {
  return Container(
    height: 300,
    width: size.width - (size.width / 10),
    child: FittedBox(
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue),
      ),
    ),
  );
}
