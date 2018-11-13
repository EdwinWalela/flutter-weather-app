import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' show get;
import 'dart:async';
import 'dart:convert';

import '../models/current_weather.dart';
import '../widgets/current_weather.dart';
import '../widgets/hourly_forecast.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CurrentWeatherModel> currentWeather = [];

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
    int time = result['dt'];
    int temp = int.parse('${(result['main']['temp']-273).round()}');
    int tempMin = int.parse('${(result['main']['temp_min']-273).round()}');
    int tempMax = int.parse('${(result['main']['temp_max']-273).round()}');
    String desc =  result['weather'][0]['description'];
    
   
    List<CurrentWeatherModel> fetchedWeather = [CurrentWeatherModel.fromJson(name,temp,tempMin,tempMax,desc,elevetion,time)];
    setState(()=>currentWeather = fetchedWeather);
  }

  Future<Null> _handleRefresh() async{
    await fetchCurrentWeather();
  }

  @override
  void initState() {
    super.initState();
    fetchCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 50.0,
      onRefresh:_handleRefresh,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          child:Column(
            children: <Widget>[
              CurrentWeather(currentWeather),
              Container(margin: EdgeInsets.only(top:0.0),),
              HourlyForecast(),
            ],
          ),
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
