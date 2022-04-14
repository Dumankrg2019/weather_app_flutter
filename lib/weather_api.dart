import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:serializable_fl01/models/weather_forecast_daily.dart';
import 'package:serializable_fl01/utils/constants.dart';
class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity({required String cityName}) async {
    var queryParameters = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName
    };

    var uri = Uri
        .https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH,
        queryParameters);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if(response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}