import 'package:flutter/material.dart';

const ColorPrimarioClaro = Color(0xFFb71c1c);
const ColorSecundarioClaro = Color(0xFFFFFFF2);

Container fondoBienvenida({Widget child}) {
  return Container(
    child: child,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.indigo[600], Colors.indigo[700], Colors.indigo[800], Colors.indigo[900]],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
    ),
  );
}

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
