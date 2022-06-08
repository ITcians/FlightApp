import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/flight_ticket.dart';
import 'all_exceptions.dart';

class FlightTicketApi {
  FlightTicketApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();
  static const _authority = "api.travelpayouts.com";

  final http.Client _httpClient;

  Future<FlightTicket> flightTicketsForSpecificDates() async {
    http.Response response;
    final uri = Uri.https(_authority, "/aviasales/v3/prices_for_dates", {
      "origin": "LON",
      "destination": "CDG",
      "departure_at": "2022-07",
      "return_at": "2022-08",
      "unique": "false",
      "sorting": "price",
      "direct": "false",
      "currency": "rub",
      "limit": "30",
      "page": "1",
      "one_way": "true",
      "token": "fbafe95f54068fb7b0ffc22e6f523bce"
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
      return FlightTicket.fromMap(body);
    } on Exception {
      throw JsonDecodeException();
    }
  }
}
