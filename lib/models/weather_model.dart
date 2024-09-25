class Weather{
  final String cityName;
  final double temperature; // Change this to double
  final String mainCondition;

  Weather({
    required this.cityName,
    required this.mainCondition,
    required this.temperature,
});
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      // Correctly extract the temperature as a double
      temperature: json['main']['temp'].toDouble(), // Change this line
      mainCondition: json['weather'][0]['main'],
    );
  }
}