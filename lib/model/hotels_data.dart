import 'dart:convert';

import 'package:equatable/equatable.dart';

class HotelsData extends Equatable {
  final Results results;
  final String status;
  const HotelsData({
    required this.results,
    required this.status,
  });

  HotelsData copyWith({
    Results? results,
    String? status,
  }) {
    return HotelsData(
      results: results ?? this.results,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'results': results.toMap(),
      'status': status,
    };
  }

  factory HotelsData.fromMap(Map<String, dynamic> map) {
    return HotelsData(
      results: Results.fromMap(map['results']),
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HotelsData.fromJson(String source) =>
      HotelsData.fromMap(json.decode(source));

  @override
  String toString() => 'HotelsData(results: $results, status: $status)';

  @override
  List<Object> get props => [results, status];
}

class Results extends Equatable {
  final List<Locations> locations;
  final List<Hotel> hotels;
  const Results({
    required this.locations,
    required this.hotels,
  });

  Results copyWith({
    List<Locations>? locations,
    List<Hotel>? hotels,
  }) {
    return Results(
      locations: locations ?? this.locations,
      hotels: hotels ?? this.hotels,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'locations': locations.map((x) => x.toMap()).toList(),
      'hotels': hotels.map((x) => x.toMap()).toList(),
    };
  }

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      locations: List<Locations>.from(
          map['locations']?.map((x) => Locations.fromMap(x))),
      hotels: List<Hotel>.from(map['hotels']?.map((x) => Hotel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Results.fromJson(String source) =>
      Results.fromMap(json.decode(source));

  @override
  String toString() => 'Results(locations: $locations, hotels: $hotels)';

  @override
  List<Object> get props => [locations, hotels];
}

class Hotel extends Equatable {
  final String locationName;
  final LocationHotel location;
  final String id;
  final double score;
  final String label;
  final int locationId;
  final String fullName;
  const Hotel({
    required this.locationName,
    required this.location,
    required this.id,
    required this.score,
    required this.label,
    required this.locationId,
    required this.fullName,
  });

  Hotel copyWith({
    String? locationName,
    LocationHotel? location,
    String? id,
    double? score,
    String? label,
    int? locationId,
    String? fullName,
  }) {
    return Hotel(
      locationName: locationName ?? this.locationName,
      location: location ?? this.location,
      id: id ?? this.id,
      score: score ?? this.score,
      label: label ?? this.label,
      locationId: locationId ?? this.locationId,
      fullName: fullName ?? this.fullName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'locationName': locationName,
      'location': location.toMap(),
      'id': id,
      'score': score,
      'label': label,
      'locationId': locationId,
      'fullName': fullName,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      locationName: map['locationName'] ?? '',
      location: LocationHotel.fromMap(map['location']),
      id: map['id'] ?? '',
      score: map['_score']?.toDouble() ?? 0.0,
      label: map['label'] ?? '',
      locationId: map['locationId']?.toInt() ?? 0,
      fullName: map['fullName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Hotel.fromJson(String source) => Hotel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Hotel(locationName: $locationName, location: $location, id: $id, score: $score, label: $label, locationId: $locationId, fullName: $fullName)';
  }

  @override
  List<Object> get props {
    return [
      locationName,
      location,
      id,
      score,
      label,
      locationId,
      fullName,
    ];
  }
}

class Locations extends Equatable {
  final String cityName;
  final Location location;
  final String countryName;
  final String fullName;
  final String id;
  final String countryCode;
  final String hotelsCount;
  final double score;
  final List<String> iata;
  const Locations({
    required this.cityName,
    required this.location,
    required this.countryName,
    required this.fullName,
    required this.id,
    required this.countryCode,
    required this.hotelsCount,
    required this.score,
    required this.iata,
  });

  Locations copyWith({
    String? cityName,
    Location? location,
    String? countryName,
    String? fullName,
    String? id,
    String? countryCode,
    String? hotelsCount,
    double? score,
    List<String>? iata,
  }) {
    return Locations(
      cityName: cityName ?? this.cityName,
      location: location ?? this.location,
      countryName: countryName ?? this.countryName,
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
      countryCode: countryCode ?? this.countryCode,
      hotelsCount: hotelsCount ?? this.hotelsCount,
      score: score ?? this.score,
      iata: iata ?? this.iata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cityName': cityName,
      'location': location.toMap(),
      'countryName': countryName,
      'fullName': fullName,
      'id': id,
      'countryCode': countryCode,
      'hotelsCount': hotelsCount,
      'score': score,
      'iata': iata,
    };
  }

  factory Locations.fromMap(Map<String, dynamic> map) {
    return Locations(
      cityName: map['cityName'] ?? '',
      location: Location.fromMap(map['location']),
      countryName: map['countryName'] ?? '',
      fullName: map['fullName'] ?? '',
      id: map['id'] ?? '',
      countryCode: map['countryCode'] ?? '',
      hotelsCount: map['hotelsCount'] ?? '',
      score: map['_score']?.toDouble() ?? 0.0,
      iata: List<String>.from(map['iata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Locations.fromJson(String source) =>
      Locations.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Locations(cityName: $cityName, location: $location, countryName: $countryName, fullName: $fullName, id: $id, countryCode: $countryCode, hotelsCount: $hotelsCount, score: $score, iata: $iata)';
  }

  @override
  List<Object> get props {
    return [
      cityName,
      location,
      countryName,
      fullName,
      id,
      countryCode,
      hotelsCount,
      score,
      iata,
    ];
  }
}

class LocationHotel extends Equatable {
  final double lon;
  final double lat;
  const LocationHotel({
    required this.lon,
    required this.lat,
  });

  LocationHotel copyWith({
    double? lon,
    double? lat,
  }) {
    return LocationHotel(
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

  factory LocationHotel.fromMap(Map<String, dynamic> map) {
    return LocationHotel(
      lon: map['lon']?.toDouble() ?? 0.0,
      lat: map['lat']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationHotel.fromJson(String source) =>
      LocationHotel.fromMap(json.decode(source));

  @override
  String toString() => 'LocationHotel(lon: $lon, lat: $lat)';

  @override
  List<Object> get props => [lon, lat];
}

class Location extends Equatable {
  final String lon;
  final String lat;
  Location({
    required this.lon,
    required this.lat,
  });

  Location copyWith({
    String? lon,
    String? lat,
  }) {
    return Location(
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

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      lon: map['lon'] ?? '',
      lat: map['lat'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));

  @override
  String toString() => 'Location(lon: $lon, lat: $lat)';

  @override
  List<Object> get props => [lon, lat];
}
