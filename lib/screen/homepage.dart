import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/control/weather_cubit.dart';
import 'package:weather/control/weather_state.dart';
import 'package:weather/screen/widget/app_bar_widget.dart';
import 'package:weather/screen/widget/initia_widget.dart';
import 'package:weather/screen/widget/succeed_widget.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Scaffold(
          appBar: AppBarWidget(),
          body: BlocBuilder<WeatherCubit,WeatherState>(
            builder: (context, state) {
              if(state is LoadState){
                return Center(child: CircularProgressIndicator(),);
              }
              if(state is SucceedState){
                return Center(child: SucceedWidget());
              }
              return InitialWidget();
            },


          ),
        ),
      ),
    );
  }
}

