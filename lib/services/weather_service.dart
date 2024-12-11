import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '07c8eaca0110427688b14909240608';

  Future<WeatherModel> getweather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data["error"]["message"] ?? 'oops error , try later!!';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString()); 
      throw Exception("oops error , try later!!"); 
    }
  }
}
