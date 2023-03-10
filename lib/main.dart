import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/model/weatherModel.dart';
import 'package:weather/provider/weather_provider.dart';
import 'screen/homepage.dart';

void main() async {
  runApp(ChangeNotifierProvider(create: (context) => WeatherProvider(),child: WeatherAPP(),));
}

class WeatherAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherModel ?weatherThem=Provider.of<WeatherProvider>(context).wheatherData;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch:weatherThem==null?Colors.blue:weatherThem.getcolor(),
      ),
    );
  }
}
