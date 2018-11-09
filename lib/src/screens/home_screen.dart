import 'package:flutter/material.dart';

import '../widgets/current_weather.dart';


class HomeScreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
      child:Column(
        children: <Widget>[
          CurrentWeather()
          //hourly forecast widget
          //weekly forecast widget
        ],
      )
    );
  }
}