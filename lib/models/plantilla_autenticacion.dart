class PlantillaAutenticacion {
  @override
  String toString() {
    return super.toString();
  }
}

class TokenPOJO implements PlantillaAutenticacion {
  String token;
  TokenPOJO(this.token);
}

class MensajePOJO implements PlantillaAutenticacion {
  String mensaje;
  MensajePOJO(this.mensaje);
}

class LogeadoPOJO implements PlantillaAutenticacion {
  bool logeado;
  LogeadoPOJO(this.logeado);
}
