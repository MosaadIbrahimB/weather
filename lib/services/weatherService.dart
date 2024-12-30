import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/weatherModel.dart';

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String key = '7ed43d914353416b9bd04208231003';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$key &q=$cityName&aqi=no');
    try {
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      WeatherModel WeatherFromJson = WeatherModel.fromJson(data);
      return WeatherFromJson;
    } on Exception catch (e) {
      throw e;
    }
  }
}
