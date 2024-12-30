import 'package:flutter/material.dart';

class WeatherEntity{
  String ?nameCity;
  String ?date;
  String ?time;
  String ?imagePath;
  double? maxDegree;
  double? minDegree;
  double? avgDegree;
  String ? stateWeather;
  Color?color;

  WeatherEntity(
      {this.nameCity,
      this.date,
      this.time,
      this.imagePath,
      this.maxDegree,
      this.minDegree,
      this.avgDegree,
      this.stateWeather,
      this.color});
}