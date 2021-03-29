class NoAutenticado implements Exception {
  @override
  String toString() {
    return "Usuario no está autenticado";
  }
}
