import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/services/weatherService.dart';
import 'control/weather_cubit.dart';
import 'screen/homepage.dart';

void main() async {
  runApp(BlocProvider(
    create: (context) =>WeatherCubit(weatherService: WeatherService()),
    child: WeatherAPP(),
  ));
}

class WeatherAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // theme: ThemeData(
      //     appBarTheme: AppBarTheme(
      //   color: WeatherCubit.get(context).modelToEntity?.color == null
      //       ? Colors.blue
      //       : WeatherCubit.get(context).modelToEntity?.color,
      //   elevation: 0
      // )),
    );
  }
}
