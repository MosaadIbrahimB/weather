import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:weather/model/weatherModel.dart';
import 'package:weather/provider/weather_provider.dart';
import '../services/weatherService.dart';
import 'homepage.dart';

class SearchCity extends StatelessWidget {
  String? cityName;
// VoidCallback  updatHomePage;
//   SearchCity({required this.updatHomePage});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text(
              "Search a city",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          body: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      letterSpacing: .5),
                  decoration: InputDecoration(
                    hintText: 'Enter a city',
                    hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    label: Text('Search'),
                    labelStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 5,
                        style: BorderStyle.solid,
                      ),
                    ),
                    suffix: Icon(Icons.search),
                  ),
                  onSubmitted: (data) async {
                   try{ cityName = data;
                   WeatherService weatherOb = WeatherService();
                   WeatherModel weatherCity =await weatherOb.getWeather(cityName: cityName!);
                   Provider.of<WeatherProvider>(context,listen: false).wheatherData=weatherCity;
                   Provider.of<WeatherProvider>(context,listen: false).cityNameProvider=cityName;



                   // updatHomePage();
                   Navigator.pop(context);
                   print(weatherCity);
                   // a = weatherCity;
                   }catch(e){
                     print(e);
                   }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
ElevatedButton(onPressed: ()=>getWeather(),
child: Text('OK'))
void getWeather()async{

  try{
    Uri u=Uri.parse("http://api.weatherapi.com/v1/current.json?key=104602adc57a446cbbd162702231902&q=London&aqi=no");
    http.Response response=await http.get(u);
    print(response.body);
  }catch(e){
    print(e);
  }

}

 */
// var a;
