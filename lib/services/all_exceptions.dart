class HttpException implements Exception {}

class JsonDecodeException implements Exception {}

class HttpRequestFailure implements Exception {
  const HttpRequestFailure(this.statusCode);

  final int statusCode;
}
