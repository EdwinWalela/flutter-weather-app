class CurrentWeatherModel {
  String location;
  int temp,tempMin,tempMax;
  String description;

  CurrentWeatherModel.fromJson(this.location,this.temp,this.tempMin,this.tempMax,this.description);
  
}