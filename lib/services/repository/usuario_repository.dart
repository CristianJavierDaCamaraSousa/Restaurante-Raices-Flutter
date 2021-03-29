import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurante_raices/services/http/respuestas.dart';
import 'package:restaurante_raices/services/http/solicitudes_http.dart';

class UsuarioRepository {
  SolicitudesHttp solicitudes;
  String keyJWT = "Bearer ";

  final StreamController<String> _mensaje = StreamController();
  final StreamController<bool> _logeado = StreamController();

  UsuarioRepository() {
    solicitudes = SolicitudesHttp();
  }

  Stream<String> get streamMensajes {
    return _mensaje.stream;
  }

  Stream<bool> get streamLogeado {
    return _logeado.stream;
  }

  bool estaLogeado() {
    if (keyJWT.length > 7) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> loginPruebaUsuarioUser() async {
    return login(
      user: 'user',
      password: 'contra',
    );
  }

  Future<bool> login({@required String user, @required String password}) async {
    if (!estaLogeado()) {
      Respuestas res = await solicitudes.solicitudPost(
        ruta: "/login",
        bodyJson: {
          "username": user,
          "password": password,
        },
      );

      if (res.body != null) {
        this.keyJWT += res.body;
        _logeado.sink.add(true);
        //_mensaje.sink.add(this.keyJWT);
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

    _preprocesadoRespuesta(res);

    if (res.body != null) {
      print(res.body);
      //_mensaje.sink.add(res.body);
    }

    // Si no se hace exitosamente
    //throw Exception('Error en la solicitud | Código: ${response.statusCode}');

    print("finalizado");
  }

  _preprocesadoRespuesta(Respuestas respuesta) {
    if (respuesta.statusCode != 200) {
      if (!respuesta.autenticado) {
        this.keyJWT = "Bearer ";
        _logeado.sink.add(false);
      }
    }
  }
}
