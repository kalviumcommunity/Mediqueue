import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesService {
  // Using the same Google Maps API key configured in AndroidManifest.xml
  static const String _apiKey = 'AIzaSyBCeX1TSe_lDObczUM_8ZVLRoKANT2-T1M';

  /// Search for nearby hospitals based on a location name
  Future<List<HospitalPlace>> searchNearbyHospitals(String placeName,
      {int radius = 5000}) async {
    try {
      // First, geocode the place name to get coordinates
      final coordinates = await _geocodePlace(placeName);
      if (coordinates == null) {
        return [];
      }

      // Then search for nearby hospitals
      return await _findNearbyHospitals(coordinates, radius);
    } catch (e) {
      print('Error searching nearby hospitals: $e');
      return [];
    }
  }

  /// Search for nearby hospitals based on coordinates
  Future<List<HospitalPlace>> searchNearbyHospitalsByCoords(
    LatLng location, {
    int radius = 5000,
  }) async {
    try {
      return await _findNearbyHospitals(location, radius);
    } catch (e) {
      print('Error searching nearby hospitals: $e');
      return [];
    }
  }

  /// Convert a place name to coordinates using Geocoding API
  Future<LatLng?> _geocodePlace(String placeName) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?address=${Uri.encodeComponent(placeName)}&key=$_apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['results'].isNotEmpty) {
        final location = data['results'][0]['geometry']['location'];
        return LatLng(location['lat'], location['lng']);
      }
    }
    return null;
  }

  /// Find nearby hospitals using Places API
  Future<List<HospitalPlace>> _findNearbyHospitals(
    LatLng location,
    int radius,
  ) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
      'location=${location.latitude},${location.longitude}'
      '&radius=$radius'
      '&type=hospital'
      '&key=$_apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<HospitalPlace> hospitals = [];

      for (var result in data['results']) {
        hospitals.add(HospitalPlace.fromJson(result));
      }

      return hospitals;
    }

    return [];
  }

  /// Get detailed information about a place
  Future<Map<String, dynamic>?> getPlaceDetails(String placeId) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/details/json?'
      'place_id=$placeId'
      '&fields=name,formatted_address,formatted_phone_number,opening_hours,rating,reviews'
      '&key=$_apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['result'];
    }

    return null;
  }
}

class HospitalPlace {
  final String placeId;
  final String name;
  final String address;
  final LatLng location;
  final double? rating;
  final bool isOpen;

  HospitalPlace({
    required this.placeId,
    required this.name,
    required this.address,
    required this.location,
    this.rating,
    this.isOpen = true,
  });

  factory HospitalPlace.fromJson(Map<String, dynamic> json) {
    final location = json['geometry']['location'];
    return HospitalPlace(
      placeId: json['place_id'],
      name: json['name'],
      address: json['vicinity'] ?? '',
      location: LatLng(location['lat'], location['lng']),
      rating: json['rating']?.toDouble(),
      isOpen: json['opening_hours']?['open_now'] ?? true,
    );
  }
}
