import '../screen/weather_entity.dart';

abstract class WeatherState {}

class InitState extends WeatherState{}
class LoadState extends WeatherState{}
class SucceedState extends WeatherState{
  WeatherEntity? modelToEntity;
  SucceedState({this.modelToEntity});
}
class ErrorState extends WeatherState{
  String? msg;

  ErrorState({this.msg});
}