import 'package:flutter/material.dart';

import 'screen/homepage.dart';

void main() async{
  runApp(WeatherAPP());
}

class WeatherAPP extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}



