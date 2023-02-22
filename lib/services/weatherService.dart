
import 'dart:convert';

import 'package:http/http.dart' as http;


class WeatherService{
  String baseUrl="http://api.weatherapi.com/v1";
  String key='104602adc57a446cbbd162702231902';

void getWeather({required String cityName}) async{
  Uri url=Uri.parse('$baseUrl/current.json?key=$key&q=$cityName&aqi=no');
  http.Response response=await http.get(url);
  Map<String , dynamic> data=jsonDecode(response.body);
  print(data['location']["localtime"]);
}

// void getWeather({required String cityName}) async{
//   Uri url=Uri.parse( '$baseUrl/current.json?key=$key&q=$cityName&aqi=no');
//   http.Response response = await http.get(url);
// Map<String , dynamic> data= jsonDecode(response.body);
//   print(data['location']);
// }
}





// void getWeather()async{
//   Uri u=Uri.parse("http://api.weatherapi.com/v1/current.json?key=104602adc57a446cbbd162702231902&q=London&aqi=no");
//   http.Response response=await http.get(u);
//   // print(response.body);
//
// }