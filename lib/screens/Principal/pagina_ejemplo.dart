import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurante_raices/models/plantilla_autenticacion.dart';
import 'package:restaurante_raices/services/get_it.dart';
import 'package:restaurante_raices/services/repository/usuario_repository.dart';
import 'package:restaurante_raices/shared/components/constants.dart';

class PaginaEjemplo extends StatefulWidget {
  @override
  _PaginaEjemploState createState() => _PaginaEjemploState();
}

class _PaginaEjemploState extends State<PaginaEjemplo> {
  String info;
  Future<bool> loginCorrecto;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.maybeOf(context);
    Size size = mq.size ?? 0;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      loginCorrecto = getIt.get<UsuarioRepository>().logoutTEMPORAL();
                    });
                  },
                  child: Text("Logout"),
                ),
                TextButton(
                  onPressed: () {
                    getIt.get<UsuarioRepository>().pruebaCredenciales();
                  },
                  child: Text("PruebaLogin"),
                ),
                Consumer<MensajePOJO>(
                  builder: (context, value, child) {
                    return textoArreglado(size: size, texto: "${value.mensaje}");
                  },
                ),
                FutureBuilder(
                  future: loginCorrecto,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data) {
                        return textoArreglado(size: size, texto: "Login realizado Correctamente");
                      } else {
                        return textoArreglado(size: size, texto: "Login Fallido");
                      }
                    } else if (snapshot.hasError) {
                      return textoArreglado(size: size, texto: "${snapshot.error}");
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
