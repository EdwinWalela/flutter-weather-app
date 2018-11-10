class HourlyWeatherModel{
  String time;
  int temp;

  HourlyWeatherModel(int _time,int _temp){
      int _hour,_min;
      String hr , mn;

      var date = DateTime.fromMillisecondsSinceEpoch(_time*1000);
      _hour = date.hour;
      hr =   _hour <= 10 ? '0$_hour' : '$_hour';
      _min = date.minute;
      mn = _min <= 10 ? '0$_min' : '$_min';
      if(_hour < 10 ){
        time = '$hr:$mn am';
      }else{
        time = '$hr:$mn pm';
      }
      temp = _temp;
  }
}