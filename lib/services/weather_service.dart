import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';


class WeatherService {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'bf5b848f4db245109fc124221242404';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName})
  async {
        Response response = await dio.get(
            '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7'
        );
        WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
  }
}