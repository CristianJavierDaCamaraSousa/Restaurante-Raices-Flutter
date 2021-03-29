import 'dart:convert';
import 'dart:io';

final username = 'username';
final password = 'password';
final credentials = '$username:$password';
final stringToBase64 = utf8.fuse(base64);
final encodedCredentials = stringToBase64.encode(credentials);

Map<String, String> headers = {
  HttpHeaders.contentTypeHeader: "application/json", // or whatever
  HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
};

final token = 'WIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ikpv';
Map<String, String> headers1 = {
  HttpHeaders.contentTypeHeader: "application/json", // or whatever
  HttpHeaders.authorizationHeader: "Bearer $token",
};
