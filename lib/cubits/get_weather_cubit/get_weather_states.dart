import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class NoWeatherState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  WeatherModel? weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherStates {
  String? error;
  WeatherFailureState(String error);
}
