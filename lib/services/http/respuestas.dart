class Respuestas {
  int statusCode;
  Map<String, String> headers;
  String contentType;
  String body;

  Respuestas({
    this.statusCode,
    this.headers,
    this.contentType,
    this.body,
  });
}
