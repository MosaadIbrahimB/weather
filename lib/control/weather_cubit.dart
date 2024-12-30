import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/control/weather_state.dart';

import '../model/weatherModel.dart';
import '../screen/weather_entity.dart';
import '../services/weatherService.dart';

class WeatherCubit extends Cubit<WeatherState> {
  static WeatherCubit get(context) => BlocProvider.of(context);

  final WeatherService weatherService;
  WeatherEntity? modelToEntity;


  WeatherCubit({required this.weatherService}) : super(InitState());

  Future<void> getWeather({required String cityName}) async {
    emit(LoadState());
    try {
      WeatherModel? _weatherModel = await weatherService.getWeather(cityName: cityName);
      modelToEntity = _weatherModel.modelToEntity();
      emit(SucceedState(modelToEntity: modelToEntity));
    } catch (e) {
      emit(ErrorState(msg: e.toString()));
    }
  }
}
