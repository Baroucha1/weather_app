import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
class WeatherService {
  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(
        Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load weather data');
    }


  }
  Future<String> getCurrentCity() async {
    // Get permission from the user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
      throw Exception('Location permission denied');
    }

    // Fetch the current location
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    // Print the current position coordinates
    print('Current position: ${position.latitude}, ${position.longitude}');

    // Convert the location into a list of placemark objects
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    // Check if placemarks is not empty
    if (placemarks.isNotEmpty) {
      // Print all details of the first placemark
      print('Placemark details: ${placemarks[0]}');

      // Extract the city name from the first placemark
      String? city = placemarks[0].locality;

      // Print the city name
      print('City name: $city');

      if (city == null || city.isEmpty) {
        throw Exception('Unable to determine city');
      }

      return city;
    } else {
      throw Exception('No placemarks found');
    }
  }

}