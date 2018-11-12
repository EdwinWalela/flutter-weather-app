import 'package:flutter/material.dart';
import '../models/current_weather.dart';

class CurrentWeather extends StatelessWidget{
  
  final List<CurrentWeatherModel> currentWeather;

  CurrentWeather(this.currentWeather);

 getTime(int _time){
    var date = DateTime.fromMillisecondsSinceEpoch(_time*1000);
    var now = DateTime.now();
    var diff = now.difference(date);
    return diff.inMinutes;
}

getLastUpdate(){
    if(getTime(currentWeather[0].timestamp)>60){
      return '${(getTime(currentWeather[0].timestamp)/60).round()} hour(s) ago';
    }else{
      print(getTime(currentWeather[0].timestamp));
      return '${(getTime(currentWeather[0].timestamp))} minutes ago';
    }
}

  Widget build(BuildContext context){
   
    return Container(
      margin: EdgeInsets.only(top: 50.0,bottom: 20.0,left: 20.0,right: 20.0),
      padding: EdgeInsets.all(20.0),
      child:Center(
        child:Column(
        children: <Widget>[
          Text(     
              currentWeather.length == 0 ? '' : '  ${currentWeather[0].location}',    
              style: TextStyle(
                color: Colors.white,
                fontFamily: "sanserif",
                fontWeight: FontWeight.w200,
                fontSize: 20.0,  
              ),
            ),
        Container(margin: EdgeInsets.only(top:15.0),),
        Container(
          margin:EdgeInsets.only(left:15.0),
          child:Text(     
              currentWeather.length == 0 ? '' : ' ${currentWeather[0].temp}°',    
              style: TextStyle(
                color: Colors.white,
                fontFamily: "sanserif",
                fontWeight: FontWeight.w200,
                fontSize: 110.0,  
              ),
            ),
        ),
          Container(margin: EdgeInsets.all(20.0),),
          Text(
             currentWeather.length == 0 ? '' : ' ${currentWeather[0].description}',      
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,  
              ),
            ),
          Container(margin: EdgeInsets.all(10.0),),
          Text(
             currentWeather.length == 0 ? '' : ' ${currentWeather[0].altitude} m',
            style:TextStyle(
              color: Colors.white,
              fontSize: 16.0
            )
          ),
          Container(margin: EdgeInsets.only(top:50.0),),
          Text(currentWeather.length == 0 ? 'Waiting for internet connection' : ' Last updated ${getLastUpdate()}',
            style:TextStyle(
                color: Colors.white,
                fontSize: 10.0
            )
          )
        ],
      ),
      ) 
    );
  }
}