import 'package:flutter/material.dart';
import 'package:restaurante_raices/shared/components/constants.dart';

class YaTengoUnaCuenta extends StatelessWidget {
  final bool login;
  final Function press;
  const YaTengoUnaCuenta({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "¿No tienes una cuenta? " : "¿Ya tienes una cuenta? ",
          style: TextStyle(color: ColorPrimario),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " Regístrate" : " Inicia sesión",
            style: TextStyle(
              color: ColorPrimario,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
