import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_raices/models/plantilla_autenticacion.dart';
import 'package:restaurante_raices/screens/Login/login.dart';
import 'package:restaurante_raices/screens/Principal/pagina_ejemplo.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool logeado = Provider.of<LogeadoPOJO>(context).logeado;

    if (logeado) {
      return PaginaEjemplo();
    } else {
      return Login();
    }
  }
}
