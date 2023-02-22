import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/weatherService.dart';

class SearchCity extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Scaffold(
          appBar: AppBar(
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
                padding:const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      letterSpacing: .5),
                  decoration:  InputDecoration(
                    hintText: 'Enter a city',
                    hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    label: Text('Search'),
                    labelStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 5,
                        style: BorderStyle.solid,
                      ),
                    ),
                    suffix: Icon(Icons.search),
                  ),
                  onSubmitted: (data) {

                    WeatherService ws=WeatherService();
                    ws.getWeather(cityName: data);
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
