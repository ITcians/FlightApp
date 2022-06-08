import 'package:http/http.dart' as http;
import 'all_exceptions.dart';

class CityCountryAirport {
  CityCountryAirport({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _authority = "autocomplete.travelpayouts.com";
  getCityCountryAirport([String term = ""]) async {
    http.Response response;
    final uri = Uri.https(_authority, "/places2", {
      "locale": "en",
      "types[]": "airport",
      "types[]": "city",
      "term": term
    });

    try {
      response = await _httpClient.get(uri);
      print(response.body);
    } on Exception {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }
  }
}
