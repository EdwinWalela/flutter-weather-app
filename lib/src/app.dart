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
      color: Colors.black,
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
        color: Colors.black,
        letterSpacing: 1.6
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
      debugShowCheckedModeBanner: true,
      home:Scaffold(
        appBar:AppBar(
          title:appbarTitle,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.3,
        ),
      body: HomeScreen(currentWeather),
      )
    );
  }
}