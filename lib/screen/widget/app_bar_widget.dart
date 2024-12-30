import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../control/weather_cubit.dart';
import '../../control/weather_state.dart';
import '../searchcity.dart';
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
  builder: (context, state) {
    return AppBar(
      elevation: 0,
      backgroundColor: WeatherCubit.get(context).modelToEntity?.color == null
          ? Colors.blue
          : WeatherCubit.get(context).modelToEntity?.color,
      centerTitle: true,
      title: const Text(
        "Weather App",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchCity())),
          icon: Icon(
            Icons.search,
            size: 28,
          ),
        )
      ],
    );
  },
);
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
