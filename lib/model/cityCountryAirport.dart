import 'dart:convert';

import 'package:equatable/equatable.dart';

class CityCountryAirport extends Equatable {
  final String type;
  final String code;
  final String name;
  final String country_code;
  final String country_name;
  final String city_code;
  final String city_name;
  final String state_code;
  final Coordinates coordinates;
  final List<String> index_strings;
  final int weight;
  final int cases;
  final int city_cases;
  final int country_cases;
  const CityCountryAirport({
    required this.type,
    required this.code,
    required this.name,
    required this.country_code,
    required this.country_name,
    required this.city_code,
    required this.city_name,
    required this.state_code,
    required this.coordinates,
    required this.index_strings,
    required this.weight,
    required this.cases,
    required this.city_cases,
    required this.country_cases,
  });

  CityCountryAirport copyWith({
    String? type,
    String? code,
    String? name,
    String? country_code,
    String? country_name,
    String? city_code,
    String? city_name,
    String? state_code,
    Coordinates? coordinates,
    List<String>? index_strings,
    int? weight,
    int? cases,
    int? city_cases,
    int? country_cases,
  }) {
    return CityCountryAirport(
      type: type ?? this.type,
      code: code ?? this.code,
      name: name ?? this.name,
      country_code: country_code ?? this.country_code,
      country_name: country_name ?? this.country_name,
      city_code: city_code ?? this.city_code,
      city_name: city_name ?? this.city_name,
      state_code: state_code ?? this.state_code,
      coordinates: coordinates ?? this.coordinates,
      index_strings: index_strings ?? this.index_strings,
      weight: weight ?? this.weight,
      cases: cases ?? this.cases,
      city_cases: city_cases ?? this.city_cases,
      country_cases: country_cases ?? this.country_cases,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'code': code,
      'name': name,
      'country_code': country_code,
      'country_name': country_name,
      'city_code': city_code,
      'city_name': city_name,
      'state_code': state_code,
      'coordinates': coordinates.toMap(),
      'index_strings': index_strings,
      'weight': weight,
      'cases': cases,
      'city_cases': city_cases,
      'country_cases': country_cases,
    };
  }

  factory CityCountryAirport.fromMap(Map<String, dynamic> map) {
    return CityCountryAirport(
      type: map['type'] ?? '',
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      country_code: map['country_code'] ?? '',
      country_name: map['country_name'] ?? '',
      city_code: map['city_code'] ?? '',
      city_name: map['city_name'] ?? '',
      state_code: map['state_code'] ?? '',
      coordinates: Coordinates.fromMap(map['coordinates']),
      index_strings: List<String>.from(map['index_strings']),
      weight: map['weight']?.toInt() ?? 0,
      cases: map['cases']?.toInt() ?? 0,
      city_cases: map['city_cases']?.toInt() ?? 0,
      country_cases: map['country_cases']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityCountryAirport.fromJson(String source) =>
      CityCountryAirport.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CityCountryAirport(type: $type, code: $code, name: $name, country_code: $country_code, country_name: $country_name, city_code: $city_code, city_name: $city_name, state_code: $state_code, coordinates: $coordinates, index_strings: $index_strings, weight: $weight, cases: $cases, city_cases: $city_cases, country_cases: $country_cases)';
  }

  @override
  List<Object> get props {
    return [
      type,
      code,
      name,
      country_code,
      country_name,
      city_code,
      city_name,
      state_code,
      coordinates,
      index_strings,
      weight,
      cases,
      city_cases,
      country_cases,
    ];
  }
}

class Coordinates extends Equatable {
  final double lon;
  final double lat;
  Coordinates({
    required this.lon,
    required this.lat,
  });

  Coordinates copyWith({
    double? lon,
    double? lat,
  }) {
    return Coordinates(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(
      lon: map['lon']?.toDouble() ?? 0.0,
      lat: map['lat']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinates.fromJson(String source) =>
      Coordinates.fromMap(json.decode(source));

  @override
  String toString() => 'Coordinates(lon: $lon, lat: $lat)';

  @override
  List<Object> get props => [lon, lat];
}
