class CurrentWeatherModel {
  String location;
  int temp,tempMin,tempMax;
  double altitude;
  String description;
  int timestamp;

  CurrentWeatherModel.fromJson(this.location,this.temp,this.tempMin,this.tempMax,this.description,this.altitude,this.timestamp);


}