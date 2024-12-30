import 'package:flutter/material.dart';
import 'package:weather/screen/weather_entity.dart';
import '../../control/weather_cubit.dart';

class SucceedWidget extends StatelessWidget {
  const SucceedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherEntity? weather = WeatherCubit.get(context).modelToEntity;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          weather?.color??Colors.red,
          weather!.color?.withOpacity(.7)??Colors.red,
          weather.color?.withOpacity(.5)??Colors.red,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Text(
            weather.nameCity ?? "name",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Date: ${weather.date}\nTime: ${weather.time} ',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Row(
            children: [
              Spacer(
                flex: 2,
              ),
              Image.asset(weather.imagePath??""),
              Spacer(
                flex: 2,
              ),
              Text(
                '${weather.avgDegree??""}',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'max :${weather.maxDegree}',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'min:${weather.minDegree}',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            weather.stateWeather ?? '',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
