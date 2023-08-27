class Config {
  Config._internal();
  
  static final Config _instance = Config._internal();

  factory Config() => _instance;

  String apiKey = 'd5f546c8cd7f4187b76211509232608';

  String baseUrl ='http://api.weatherapi.com/v1';
  String currentUrl = 'current.json';
  String forecastUrl = 'forecast.json';
}