import 'dart:convert';
import 'package:flightfare/model/hotels_data.dart';
import 'package:http/http.dart' as http;

import 'all_exceptions.dart';

void main() async {}

class HotelsDataAPI {
  
  HotelsDataAPI({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _authority = 'engine.hotellook.com';

  final http.Client _httpClient;

  Future<HotelsData> fetchHotelsByName() async {
    http.Response response;
    final uri = Uri.https(_authority, '/api/v2/lookup.json', {
      "query": "london",
      "lang": "en",
      "lookFor": "both",
      "limit": "1",
      "token": "fbafe95f54068fb7b0ffc22e6f523bce",
    });
      try {
        response = await _httpClient.get(uri);
      } on Exception {
        throw HttpException();
      }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    Map<String, dynamic> body;
    try {
      body = json.decode(response.body) as Map<String, dynamic>;
      return HotelsData.fromMap(body);
    } on Exception {
      throw JsonDecodeException();
    }
  }
}
