import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../control/weather_cubit.dart';


class SearchCity extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "Search a city",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          body: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      letterSpacing: .5),
                  decoration: InputDecoration(
                    hintText: 'Enter a city',
                    hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    label: Text('Search'),
                    labelStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 5,
                        style: BorderStyle.solid,
                      ),
                    ),
                    suffix: Icon(Icons.search),
                  ),
                  onSubmitted: (data)  {
                    BlocProvider.of<WeatherCubit>(context).getWeather(cityName: data);
                    Navigator.pop(context);


                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

