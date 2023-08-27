import 'dart:io';

import 'package:weather_console_app/weather_api_client.dart';

void main(List<String> arguments) async {
  if (arguments.length != 1) {
    print('Syntax error: dart bin/main.dart <city>');
    return;
  }

  final cityName = arguments.first;
  // print(cityName);

  final weatherApiClient = WeatherApiClient();

  // Getting current weather
  try {
    final currentWeather = await weatherApiClient.getCurrentWeather(cityName);
    print('Current weather for $cityName');
    print(currentWeather);
    print('---------------------------\n');
  } on WeatherApiException catch (error) {
    print('Error: ${error.message}');
  } on SocketException catch (_) {
    print(
        'Could not fetch current weather data. Check your internet connection!');
  } catch (e) {
    print('Error: $e');
  }

  // Getting weekly forecast
  try {
    final weeklyForecast = await weatherApiClient.getWeeklyForecast(cityName);
    print('Weekly forecast for $cityName');
    weeklyForecast.forEach((forecast) {
      print(forecast);
      print('---------------------------\n');
    });
  } on WeatherApiException catch (error) {
    print('Error: ${error.message}');
  } on SocketException catch (_) {
    print('Could not fetch forecast data. Check your internet connection!');
  } catch (e) {
    print('Error: $e');
  }
}
