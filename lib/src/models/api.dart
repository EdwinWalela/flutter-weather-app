import 'dart:async';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:location/location.dart';

import '../models/hourly_weather.dart';

class ApiConfig {

      static String _APIKEY = '9d646800231533d6e07ae7d77f155987';
      static var location;
      static Map<String, double> currentLocation;

  static fetchHourlyWeather() async{
    location = new Location();
    currentLocation = await location.getLocation();
    double lon = currentLocation['longitude'];
    double lat = currentLocation['latitude'];
    String URI = 'https://api.openweathermap.org/data/2.5/forecast?&appid=$_APIKEY&lat=$lat&lon=$lon';
    
    var response = await get(URI);
    var result = json.decode(response.body);

    List<HourlyWeatherModel> hourlyForecast = [];

    for(int i = 0; i < 5; i++){
      int temp = int.parse('${(result['list'][i]['main']['temp']-273).round()}');
      int time = result['list'][i]['dt'];
      var forecast = new HourlyWeatherModel(time,temp);
      hourlyForecast.add(forecast);
    }
    return hourlyForecast;
  }
}