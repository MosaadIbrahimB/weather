import 'package:flutter/material.dart';
import 'package:weather/screen/weather_entity.dart';

class WeatherModel {
  Location? location;
  Forecast? forecast;

  WeatherModel({this.location, this.forecast});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
  }


  WeatherEntity modelToEntity(){
    return WeatherEntity(
      nameCity: location?.name,
      date: location?.localtime?.substring(0,10),
      time: location?.localtime?.substring(10),
      minDegree: forecast?.forecastday![0].day?.mintempC,
      maxDegree: forecast?.forecastday![0].day?.maxtempC,
      avgDegree: forecast?.forecastday![0].day?.avgtemp_c,
      stateWeather:forecast?.forecastday![0].day?.condition?.text,
      imagePath:_getImg(),
      color: _getColor()
    );
  }

  String _getImg() {
  String?  weatherStateName=forecast?.forecastday![0].day?.condition?.text;
    String img = (weatherStateName == 'Sunny' || weatherStateName == 'Clear')
        ? 'assets/img/clear.png'
        : (weatherStateName == 'Cloudy' || weatherStateName == 'Snow')
            ? 'assets/img/cloudy.png'
            : 'assets/img/rainy.png';
    return img;
  }

  Color _getColor() {
    String?  weatherStateName=forecast?.forecastday![0].day?.condition?.text;
    MaterialColor color = (weatherStateName == 'Sunny' ||
            weatherStateName == 'Clear')
        ? Colors.orange
        : (weatherStateName == 'Partly cloudy' || weatherStateName == 'Snow')
            ? Colors.teal
            : (weatherStateName == 'Patchy rain possible')
                ? Colors.grey
                : Colors.lightBlue;

    return color;
  }
}

class Location {
  String? name;
  String? country;
  String? localtime;

  Location({this.name, this.country, this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    localtime = json['localtime'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['country'] = this.country;
  //   data['localtime'] = this.localtime;
  //   return data;
  // }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(new Forecastday.fromJson(v));
      });
    }
  }
}

class Forecastday {
  Day? day;

  Forecastday({this.day});

  Forecastday.fromJson(Map<String, dynamic> json) {
    day = json['day'] != null ? new Day.fromJson(json['day']) : null;
  }

}


class Day {
  double? maxtempC;
  double? mintempC;
  double? avgtemp_c;
  Condition? condition;

  Day({this.maxtempC, this.mintempC, this.condition,this.avgtemp_c});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    mintempC = json['mintemp_c'];
    avgtemp_c = json['avgtemp_c'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }



}

class Condition {
  String? text;
  String? icon;

  Condition({this.text, this.icon});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
  }


  String getImg() {
    String img = (text == 'Sunny' || text == 'Clear')
        ? 'assets/img/clear.png'
        : (text == 'Cloudy' || text == 'Snow')
            ? 'assets/img/cloudy.png'
            : 'assets/img/rainy.png';
    return img;
  }


}

