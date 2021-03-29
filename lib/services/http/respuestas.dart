class Respuestas {
  int statusCode;
  Map<String, String> headers;
  String contentType;
  String body;
  bool autenticado;

  Respuestas({
    this.statusCode,
    this.headers,
    this.contentType,
    this.body,
    this.autenticado,
  });
}
