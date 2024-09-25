# Weather App 🌤️

This project is a **Flutter** weather application that provides real-time weather updates for any city. It uses the OpenWeatherMap API to fetch current weather data and displays it with an easy-to-use interface.

## Features

- 🌡️ **Current Weather**: Get temperature, humidity, and wind speed.
- 🌍 **City Search**: Search for weather conditions by entering any city name.
- 📍 **GPS-based Weather**: Optionally fetch weather using the user’s location.
- 🖼️ **Dynamic Icons**: Display different weather icons based on the current weather conditions.

## Tech Stack

- **Framework**: Flutter
- **Languages**: Dart
- **API**: [OpenWeather API](https://openweathermap.org/api)

## Setup and Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/flutter-weather-app.git
   ```

2. **Navigate into the project directory**:

   ```bash
   cd flutter-weather-app
   ```

3. **Install dependencies**:

   Make sure you have Flutter SDK installed. If not, follow the [official guide](https://flutter.dev/docs/get-started/install).

   Install dependencies by running:

   ```bash
   flutter pub get
   ```

4. **Obtain an API key** from [OpenWeatherMap](https://openweathermap.org/api).

5. **Add API key**:

   Open the `lib/services/weather_service.dart` (or the respective file for API handling) and add your API key:

   ```dart
   const String apiKey = 'your_openweather_api_key';
   ```

6. **Run the app**:

   Use the following command to run the app:

   ```bash
   flutter run
   ```

## Screenshots

| Home Screen | 
|-------------|
| <img src="https://github.com/user-attachments/assets/67d8f9c6-2d46-4977-9dff-03e58b8cc2da" alt="Home Screen" width="400"> | 


