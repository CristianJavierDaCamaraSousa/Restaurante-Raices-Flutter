import 'dart:async';

import 'package:restaurante_raices/services/http/respuestas.dart';
import 'package:restaurante_raices/services/http/solicitudes_http.dart';

class UsuarioRepository {
  SolicitudesHttp solicitudes;
  String keyJWT = "Bearer ";

  final StreamController<String> _mensaje = StreamController();

  UsuarioRepository() {
    solicitudes = SolicitudesHttp();
  }

  Stream<String> get streamMensajes {
    return _mensaje.stream;
  }

  bool estaLogeado() {
    if (keyJWT.length > 7) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> loginPruebaUsuarioUser() async {
    if (!estaLogeado()) {
      Respuestas res = await solicitudes.solicitudPost(
        ruta: "/login",
        bodyJson: {
          "username": 'user',
          "password": 'contra',
        },
      );

      if (res.body != null) {
        this.keyJWT += res.body;
        _mensaje.sink.add(this.keyJWT);
        return true;
      }
    }

    return false;
  }

  pruebaCredenciales() async {
    print("Iniciado");

    Respuestas res = await solicitudes.solicitudGet(
      ruta: "/",
      encabezado: {"Authorization": this.keyJWT},
    );

    if (res.body != null) {
      print(res.body);
      _mensaje.sink.add(res.body);
    }

    print("finalizado");
  }
}
