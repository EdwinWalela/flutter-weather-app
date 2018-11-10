import 'package:flutter/material.dart';

import '../widgets/current_weather.dart';
import '../widgets/hourly_forecast.dart';
import '../widgets/weekly_forecast.dart';


class HomeScreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
      child:Column(
        children: <Widget>[
          CurrentWeather(),
          Container(margin: EdgeInsets.only(top:10.0),),
          HourlyForecast(),
          WeeklyForecast()
        ],
      )
    );
  }
}