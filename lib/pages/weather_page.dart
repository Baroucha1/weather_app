import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/services/weather_service.dart';

import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _weatherService = WeatherService('25f9c8efd7a9daf68411ebb6886c6762');
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    // get the current city
    String cityName = await _weatherService.getCurrentCity();

    // get weather for city
    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }catch(e){
      print(e);
    }
  }

  // weather animations
  String getWeatherAnimation(String? mainCondition){
    if(mainCondition == null) return 'assetes/sunny.json'; // default to sunny

    switch( mainCondition.toLowerCase()){
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rainy.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';

    }
  }
  // init stat
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // fetch weather on startup
    _fetchWeather();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body:
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // city name
              Text(_weather?.cityName ?? "loading city..", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]), ),
              // animation
              Lottie.asset(getWeatherAnimation(_weather?.mainCondition )),
              //temperature
              Text('${_weather?.temperature.round() ?? 0}C°', style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold, color: Colors.grey[600]), ), // No need for double.parse

              // weather condition
              Text(_weather?.mainCondition ?? "" ,style: TextStyle(fontSize: 18, color: Colors.grey[800]),),
            ],
          ),
        ),


    );
  }
}
