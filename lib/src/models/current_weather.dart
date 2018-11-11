class CurrentWeatherModel {
  String location;
  int temp,tempMin,tempMax;
  double altitude;
  String description;

  CurrentWeatherModel.fromJson(this.location,this.temp,this.tempMin,this.tempMax,this.description,this.altitude);
  
}