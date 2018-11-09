import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 20.0,bottom: 20.0,left: 20.0,right: 20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.black),
      ),
      //decoration: Border.all(color: Colors.black),
      child:Center(
        child:Column(
        children: <Widget>[
        Text(     
              ' 27°',        
              style: TextStyle(
                fontFamily: "monospace",
                fontSize: 100.0,  
              ),
            ),
          Container(margin: EdgeInsets.all(10.0),),
          Text(
            'Partly cloudy',      
              style: TextStyle(
                fontSize: 20.0,  
              ),
            ),
          Container(margin: EdgeInsets.all(10.0),),
          Text('28/16')
        ],
      ),
      ) 
    );
  }
}