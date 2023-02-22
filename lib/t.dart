import 'package:http/http.dart' as http;

void main() async{
  getWeather();
  print('aaa');

}

Future prin55(){
  return Future.delayed( Duration(seconds: 2), () => '66' );


}



void getWeather()async {
  Uri u = Uri.parse( "http://api.weatherapi.com/v1/current.json?key=104602adc57a446cbbd162702231902&q=London&aqi=no");
  http.Response response = await http.get(u);
  print(response.body);
}




// class WeatherService {
//   Future<WeatherModel?> getWeather({required String cityName}) async {
//     WeatherModel? weather;
//     try {
//       String baseUrl = 'http://api.weatherapi.com/v1';
//       String apiKey = 'c9f3945c6eae4ec188b61511220709';
//       Uri url = Uri.parse(
//           '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=5&aqi=no&alerts=no');
//       http.Response response = await http.get(url);
//       Map<String, dynamic> data = jsonDecode(response.body);
//       weather = WeatherModel.fromJson(data);
//     } catch (e) {
//       print(e);
//     }
//     return weather;
//   }
// }