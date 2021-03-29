import 'package:restaurante_raices/services/http/respuestas.dart';

import '../http/solicitudes_http.dart';

class Database {
  SolicitudesHttp solicitudes;
  String keyJWT = "Bearer ";

  Database() {
    solicitudes = SolicitudesHttp();
  }

  loginUsuarioUser() async {
    print("Iniciado");

    Respuestas res = await solicitudes.solicitudPost(
      ruta: "/login",
      bodyJson: {
        "username": 'user',
        "password": 'contra',
      },
    );
    if (res.body != null) {
      this.keyJWT += res.body;
    }

    print("finalizado");
  }

  pruebaCredenciales() async {
    print("Iniciado");

    Respuestas res = await solicitudes.solicitudGet(
      ruta: "/",
      encabezado: {"Authorization": this.keyJWT},
    );

    print(res.body);

    print("finalizado");
  }
}
