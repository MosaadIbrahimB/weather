import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/model/weatherModel.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/screen/searchcity.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
WeatherModel? weather;
// void updatWidget(){
//   setState(() {
//
//   });
//
// }
  @override
  Widget build(BuildContext context) {
    weather=Provider.of<WeatherProvider>(context).wheatherData;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Scaffold(
          appBar: AppBar(

            title: const Text(
              "Weather App",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchCity())),
                icon: Icon(
                  Icons.search,
                  size: 28,
                ),
              )
            ],
          ),
          //t=0   t=1
          body: weather == null //t
              //if no data back , show home page search city
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "there is no weather  😔	",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "searching now   🔍",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              //if  data back , show screen city
              : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                weather!.getcolor(),
                weather!.getcolor()[200]!,
                weather!.getcolor()[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

              )
            ),

                  child: Column(
                    children: [
                      Spacer(flex: 2,),
                      Text(
                        Provider.of<WeatherProvider>(context).cityNameProvider??'cityName==null',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'update ${weather!.date.hour.toString()} :${weather!.date.minute.toString()}',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Spacer(flex: 1,),

                      Row(
                        children: [
                          Spacer(flex: 2,),
                          Image.asset(weather!.getImg()),
                          Spacer(flex: 2,),
                          Text(
                            '${weather!.temp.toInt()}',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(flex: 2,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'max :${weather!.maxTemp.toInt()}',
                                style: TextStyle(
                                  fontSize: 22,

                                ),
                              ),
                              Text(
                                'min:${weather!.minTemp.toInt()}',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                          Spacer(flex: 2,),
                        ],
                      ),
                      Spacer(flex: 1,),
                      Text(
                        weather?.weatherStateName??'',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      Spacer(flex: 5,),

                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
