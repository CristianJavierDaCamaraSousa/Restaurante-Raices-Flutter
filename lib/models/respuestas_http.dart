class RespuestasHTTP {
  int statusCode;
  Map<String, String> headers;
  String contentType;
  String body;
  bool autenticado;

  RespuestasHTTP({
    this.statusCode,
    this.headers,
    this.contentType,
    this.body,
    this.autenticado,
  });
}
