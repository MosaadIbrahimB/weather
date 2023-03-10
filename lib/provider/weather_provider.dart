import 'package:flutter/cupertino.dart';
import 'package:weather/model/weatherModel.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _wheatherData;
String ? cityNameProvider;

set wheatherData(WeatherModel? w){
  _wheatherData=w;
  notifyListeners();
}
 WeatherModel? get wheatherData=>_wheatherData;

}