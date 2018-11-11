import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' show get;
import 'dart:async';
import 'dart:convert';

import './screens/home_screen.dart';
import './models/current_weather.dart';
import './models/hourly_weather.dart';
import './models/api.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<CurrentWeatherModel> currentWeather = [];
  var appbarTitle = Text(
    '...',
    style: TextStyle(
      color: Colors.white,
      letterSpacing: 1.6
      ),
    );

  fetchLocation() async{
    var location = new Location();
    return  await location.getLocation();
  }

  fetchCurrentWeather() async{
    Map<String, double> currentLocation = await fetchLocation();
    String APIKEY = '9d646800231533d6e07ae7d77f155987';
    double lon = currentLocation['longitude'];
    double lat = currentLocation['latitude'];
    double elevetion = (currentLocation['altitude']).roundToDouble();
    String URI = 'https://api.openweathermap.org/data/2.5/weather?&appid=$APIKEY&lat=$lat&lon=$lon';
   
    var response = await get(URI);
    var result = json.decode(response.body);

    String name =result['name'];
    int temp = int.parse('${(result['main']['temp']-273).round()}');
    int tempMin = int.parse('${(result['main']['temp_min']-273).round()}');
    int tempMax = int.parse('${(result['main']['temp_max']-273).round()}');
    String desc =  result['weather'][0]['description'];
    
    var weather = CurrentWeatherModel.fromJson(name,temp,tempMin,tempMax,desc,elevetion);

    appbarTitle = Text(
      result['name'],
      style: TextStyle(
        color: Colors.white,
        fontFamily:"sanserif",
        fontWeight: FontWeight.w300,
        letterSpacing: 1.6,
        fontSize:15.0
        ),
      );
    setState(()=>currentWeather.add(weather));
  }

  @override
  void initState() {
    super.initState();
    fetchCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
      floatingActionButton:RaisedButton(
        child: Icon(
          Icons.refresh,
          ),
        onPressed: (){
          fetchCurrentWeather();
        },
      ),
      body: Stack(
      children: <Widget>[
         Container(
          decoration: BoxDecoration(
            image:  DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1446435210126-bfa18ee3b7a1?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3566466d76117e29ffb4160a639748fb&auto=format&fit=crop&w=1202&q=80"), fit: BoxFit.cover,),
          ),
        ),
         Center(
          child:HomeScreen(currentWeather),
        )
      ],
    )
      )
    );
  }
}