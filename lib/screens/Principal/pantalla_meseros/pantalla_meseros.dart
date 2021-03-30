import 'package:flutter/material.dart';
import 'package:restaurante_raices/shared/components/constants.dart';
import 'package:restaurante_raices/shared/components/estilos.dart';
import 'package:restaurante_raices/shared/components/pantalla_fix.dart';
import 'package:restaurante_raices/shared/components/pantalla_opciones.dart';

class PantallaMesero extends StatefulWidget {
  @override
  _PantallaMeseroState createState() => _PantallaMeseroState();
}

class _PantallaMeseroState extends State<PantallaMesero> {
  @override
  Widget build(BuildContext context) {
    return PantallaOpciones(
      pestanas: [
        Tab(child: Text("Crear orden", style: estiloFont1)),
        Tab(child: Text("Visualizar Orden", style: estiloFont1)),
      ],
      pantallas: [
        PantallaFix(
          background: Container(child: fondoSolido()),
          children: [
            Icon(Icons.directions_car),
          ],
        ),
        PantallaFix(
          background: Container(child: fondoSolido()),
          children: [
            Icon(Icons.directions_transit),
          ],
        ),
      ],
    );
  }
}

/*
Esta pantalla va tener las siguientes cosas:
Nombre cliente, cedula cliente, numero telefonico cliente, id secuencia clientes
Orden de platos comida que el cliente desea
Lista de platos de comida que tiene Raices con su respectivo precio
botones de incremento o decremento de cantidades de plato comida
contenedor de total a pagar y boton subir orden 
*/
