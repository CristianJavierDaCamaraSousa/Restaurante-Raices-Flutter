import 'package:flutter/material.dart';

const ColorPrimario = Color(0xFF000000);
const ColorSecundario = Color(0xFFFFFFFF);

Container fondoSolido() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[900],
    ),
  );
}

Container fondoBienvenida({Widget child}) {
  return Container(
    child: child,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.black,
          Color(0xFF111111),
          Colors.black,
        ],
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
