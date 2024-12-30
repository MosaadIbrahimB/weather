import 'package:flutter/cupertino.dart';
import 'package:weather/model/weatherModel.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherModel;
  String? cityNameProvider;

  set weatherData(WeatherModel? w) {
    weatherModel = w;
    notifyListeners();
  }

  WeatherModel? get weatherData => weatherModel;
}
