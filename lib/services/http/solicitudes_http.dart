import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'respuestas.dart';

class SolicitudesHttp {
  String _hostname;
  String _puerto;
  Map<String, String> header;

  SolicitudesHttp() {
    _puerto = "8080";

    if (kIsWeb) {
      _hostname = 'localhost:$_puerto';
    } else if (Platform.isAndroid) {
      _hostname = '10.0.2.2:$_puerto';
    } else {
      _hostname = 'localhost:$_puerto';
    }

    header = {
      "Content-type": "application/json",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin, Content-Type, X-Amz-Date, Authorization, X-Api-Key, X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "GET, POST, PATCH, PUT, DELETE, OPTIONS"
    };
  }

  // Para pedirle cosas al servidor
  solicitudGet({@required String ruta, Map<String, String> encabezado, Map<String, dynamic> paramsJson, bool debugger = false}) async {
    if (encabezado != null) {
      this.header.addAll(encabezado);
    }

    Uri url = Uri.http(_hostname, ruta, paramsJson);
    Response response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      if (debugger) print(response.body);

      // Si se hace exitosamente
      return Respuestas(
        statusCode: response.statusCode,
        headers: response.headers,
        contentType: response.headers['content-type'],
        body: response.body,
      );
    } else {
      // Si no se hace exitosamente
      throw Exception('Error en la solicitud | Código: ${response.statusCode}');
    }
  }

  // Para crear cosas en el servidor
  solicitudPost({@required String ruta, Map<String, String> encabezado, Map<String, dynamic> bodyJson, Map<String, dynamic> paramsJson, bool debugger = false}) async {
    if (encabezado != null) {
      this.header.addAll(encabezado);
    }

    Uri url = Uri.http(_hostname, ruta, paramsJson);
    Response response = await http.post(url, headers: header, body: jsonEncode(bodyJson));

    if (response.statusCode == 200) {
      if (debugger) print(response.body);

      // Si se hace exitosamente
      return Respuestas(
        statusCode: response.statusCode,
        headers: response.headers,
        contentType: response.headers['content-type'],
        body: response.body,
      );
    } else {
      // Si no se hace exitosamente
      throw Exception('Error en la solicitud | Código: ${response.statusCode}');
    }
  }

  // Para modificar cosas en el servidor
  solicitudPut({@required String ruta, Map<String, String> encabezado, Map<String, dynamic> bodyJson, Map<String, dynamic> paramsJson, bool debugger = false}) async {
    if (encabezado != null) {
      this.header.addAll(encabezado);
    }

    Uri url = Uri.http(_hostname, ruta, paramsJson);
    Response response = await http.put(url, headers: header, body: jsonEncode(bodyJson));

    if (response.statusCode == 200) {
      if (debugger) print(response.body);

      // Si se hace exitosamente
      return Respuestas(
        statusCode: response.statusCode,
        headers: response.headers,
        contentType: response.headers['content-type'],
        body: response.body,
      );
    } else {
      // Si no se hace exitosamente
      throw Exception('Error en la solicitud | Código: ${response.statusCode}');
    }
  }

  // Para elliminar cosas en el servidor
  solicitudDelete({@required String ruta, Map<String, String> encabezado, Map<String, dynamic> bodyJson, Map<String, dynamic> paramsJson, bool debugger = false}) async {
    if (encabezado != null) {
      this.header.addAll(encabezado);
    }

    Uri url = Uri.http(_hostname, ruta, paramsJson);
    Response response = await http.delete(url, headers: header, body: jsonEncode(bodyJson));

    if (response.statusCode == 200) {
      if (debugger) print(response.body);
      // Si se hace exitosamente
      return true;
    } else {
      // Si no se hace exitosamente
      throw Exception('Error en la solicitud | Código: ${response.statusCode}');
    }
  }
}
