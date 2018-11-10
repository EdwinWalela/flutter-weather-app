import 'package:flutter/material.dart';
import '../models/hourly_weather.dart';
import '../models/api.dart';

class HourlyForecast extends StatefulWidget {
  @override
  _HourlyForecastState createState() => _HourlyForecastState();
}

class _HourlyForecastState extends State<HourlyForecast> {

  List<HourlyWeatherModel> hourlyForecast = [];

  fetchHourlyForecast() async{
    var forecast = await ApiConfig.fetchHourlyWeather(); 
    setState(() {
      hourlyForecast = forecast; 
    });
  }

  
  Widget _forecast(HourlyWeatherModel forecast){
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            forecast.time,
             style: TextStyle(
              fontSize: 11.5
            ),
          ),
          Container(margin: EdgeInsets.only(top:25.0),),
          Text(
            "${forecast.temp}°",
            style: TextStyle(
              fontSize: 18.0
            ),
          )
        ],
      ),
    );
  }

  listBuilder(){
    List<Widget> list=[];
    for(int i = 0; i < hourlyForecast.length;i++){
      list.add(_forecast(hourlyForecast[i]));
    }
    return list;
  }

 @override
  void initState(){
    super.initState();
    fetchHourlyForecast();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border:BorderDirectional(top:BorderSide(color:Colors.black,width: 0.8))),
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.only(top:15.0),
      child: Row(
        children:listBuilder()
      ),
    );
  }
}
