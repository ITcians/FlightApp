import 'dart:convert';

import 'package:equatable/equatable.dart';

class FlightTicket extends Equatable {
  final bool success;
  final List<FlightData> data;
  final String currency;
  const FlightTicket({
    required this.success,
    required this.data,
    required this.currency,
  });

  FlightTicket copyWith({
    bool? success,
    List<FlightData>? data,
    String? currency,
  }) {
    return FlightTicket(
      success: success ?? this.success,
      data: data ?? this.data,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data.map((x) => x.toMap()).toList(),
      'currency': currency,
    };
  }

  factory FlightTicket.fromMap(Map<String, dynamic> map) {
    return FlightTicket(
      success: map['success'] ?? false,
      data:
          List<FlightData>.from(map['data']?.map((x) => FlightData.fromMap(x))),
      currency: map['currency'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FlightTicket.fromJson(String source) =>
      FlightTicket.fromMap(json.decode(source));

  @override
  String toString() =>
      'FlightTicket(success: $success, data: $data, currency: $currency)';

  @override
  List<Object> get props => [success, data, currency];
}

class FlightData extends Equatable {
  final String origin;
  final String destination;
  final String origin_airport;
  final String destination_airport;
  final int price;
  final String airline;
  final String flight_number;
  final String departure_at;
  final String return_at;
  final int transfers;
  final int return_transfers;
  final int duration;
  final String link;
  FlightData({
    required this.origin,
    required this.destination,
    required this.origin_airport,
    required this.destination_airport,
    required this.price,
    required this.airline,
    required this.flight_number,
    required this.departure_at,
    required this.return_at,
    required this.transfers,
    required this.return_transfers,
    required this.duration,
    required this.link,
  });

  FlightData copyWith({
    String? origin,
    String? destination,
    String? origin_airport,
    String? destination_airport,
    int? price,
    String? airline,
    String? flight_number,
    String? departure_at,
    String? return_at,
    int? transfers,
    int? return_transfers,
    int? duration,
    String? link,
  }) {
    return FlightData(
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      origin_airport: origin_airport ?? this.origin_airport,
      destination_airport: destination_airport ?? this.destination_airport,
      price: price ?? this.price,
      airline: airline ?? this.airline,
      flight_number: flight_number ?? this.flight_number,
      departure_at: departure_at ?? this.departure_at,
      return_at: return_at ?? this.return_at,
      transfers: transfers ?? this.transfers,
      return_transfers: return_transfers ?? this.return_transfers,
      duration: duration ?? this.duration,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'origin': origin,
      'destination': destination,
      'origin_airport': origin_airport,
      'destination_airport': destination_airport,
      'price': price,
      'airline': airline,
      'flight_number': flight_number,
      'departure_at': departure_at,
      'return_at': return_at,
      'transfers': transfers,
      'return_transfers': return_transfers,
      'duration': duration,
      'link': link,
    };
  }

  factory FlightData.fromMap(Map<String, dynamic> map) {
    return FlightData(
      origin: map['origin'] ?? '',
      destination: map['destination'] ?? '',
      origin_airport: map['origin_airport'] ?? '',
      destination_airport: map['destination_airport'] ?? '',
      price: map['price']?.toInt() ?? 0,
      airline: map['airline'] ?? '',
      flight_number: map['flight_number'] ?? '',
      departure_at: map['departure_at'] ?? '',
      return_at: map['return_at'] ?? '',
      transfers: map['transfers']?.toInt() ?? 0,
      return_transfers: map['return_transfers']?.toInt() ?? 0,
      duration: map['duration']?.toInt() ?? 0,
      link: map['link'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FlightData.fromJson(String source) =>
      FlightData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FlightData(origin: $origin, destination: $destination, origin_airport: $origin_airport, destination_airport: $destination_airport, price: $price, airline: $airline, flight_number: $flight_number, departure_at: $departure_at, return_at: $return_at, transfers: $transfers, return_transfers: $return_transfers, duration: $duration, link: $link)';
  }

  @override
  List<Object> get props {
    return [
      origin,
      destination,
      origin_airport,
      destination_airport,
      price,
      airline,
      flight_number,
      departure_at,
      return_at,
      transfers,
      return_transfers,
      duration,
      link,
    ];
  }
}
