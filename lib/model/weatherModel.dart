import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  String  weatherStateName;
  double temp, minTemp, maxTemp;

  WeatherModel(
      {required this.date,
      required this.weatherStateName,
      required this.temp,
      required this.maxTemp,
      required this.minTemp});

  factory WeatherModel.fromjson(dynamic data) {
    var dataTemp = data['forecast']['forecastday'][0]['day'];
    // var time=data['location']['localtime'];

    String time = '2019-10-30T10:12:00';
    DateTime dateTime = DateTime.parse(time);
    // String formatted = formatDateWithAmPm(dateTime);
    return WeatherModel(
        date: dateTime,
        minTemp: dataTemp['mintemp_c'],
        weatherStateName: dataTemp['condition']["text"],
        temp: dataTemp['avgtemp_c'],
        maxTemp: dataTemp['maxtemp_c']);
  }


  String getImg(){
    String img=
    (weatherStateName=='Sunny'||weatherStateName=='Clear')?'assets/img/clear.png':(weatherStateName=='Cloudy'||weatherStateName=='Snow')?'assets/img/cloudy.png':'assets/img/rainy.png';
        return img;
  }


  MaterialColor getcolor(){
    MaterialColor color=
    (weatherStateName=='Sunny'||weatherStateName=='Clear')?
    Colors.orange:
    (weatherStateName=='Partly cloudy'||weatherStateName=='Snow')?
    Colors.teal:
    (weatherStateName=='Patchy rain possible')?
    Colors.grey:
        Colors.lightBlue
    ;

    return color;
  }
  @override
  String toString() {
    // TODO: implement toString
    return '\ndate: $date\ntemp: $temp\nmaxTemp:$maxTemp\nminTemp:$minTemp\nweatherStateName:$weatherStateName';
  }
}
