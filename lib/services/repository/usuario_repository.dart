import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurante_raices/models/plantilla_autenticacion.dart';
import 'package:restaurante_raices/models/respuestas_http.dart';
import 'package:restaurante_raices/services/http/solicitudes_http.dart';

class UsuarioRepository {
  SolicitudesHttp solicitudes;
  String keyJWT = "Bearer ";

  final StreamController<MensajePOJO> _mensaje = StreamController();
  final StreamController<TokenPOJO> _token = StreamController();
  final StreamController<LogeadoPOJO> _logeado = StreamController();

  UsuarioRepository() {
    solicitudes = SolicitudesHttp();
  }

  Stream<MensajePOJO> get streamMensajes {
    return _mensaje.stream;
  }

  Stream<TokenPOJO> get streamToken {
    return _token.stream;
  }

  Stream<LogeadoPOJO> get streamLogeado {
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
      RespuestasHTTP res = await solicitudes.solicitudPost(
        ruta: "/login",
        bodyJson: {
          "username": user,
          "password": password,
        },
      );

      if (res.body != null) {
        this.keyJWT += res.body;
        _token.sink.add(TokenPOJO(this.keyJWT));
        _logeado.sink.add(LogeadoPOJO(true));
        //_mensaje.sink.add(this.keyJWT);
        return true;
      }
    }

    return false;
  }

  pruebaCredenciales() async {
    print("Iniciado");

    RespuestasHTTP res = await solicitudes.solicitudGet(
      ruta: "/",
      encabezado: {"Authorization": this.keyJWT},
    );

    _preprocesadoRespuesta(res);

    if (res.body != null) {
      print(res.body);
      _mensaje.sink.add(MensajePOJO(res.body));
    }

    // Si no se hace exitosamente
    //throw Exception('Error en la solicitud | Código: ${response.statusCode}');

    print("finalizado");
  }

  logoutTEMPORAL() {
    _token.sink.add(TokenPOJO("Bear "));
    _logeado.sink.add(LogeadoPOJO(false));
  }

  _preprocesadoRespuesta(RespuestasHTTP respuesta) {
    if (respuesta.statusCode != 200) {
      if (!respuesta.autenticado) {
        this.keyJWT = "Bearer ";
        _token.sink.add(TokenPOJO(this.keyJWT));
        _logeado.sink.add(LogeadoPOJO(false));
      }
    }
  }
}
