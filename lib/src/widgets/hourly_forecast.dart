import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {

  Widget forecast(String time, int temp){
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(time),
          Container(margin: EdgeInsets.only(top:15.0),),
          Text("$temp°")
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border:BorderDirectional(top:BorderSide(color:Colors.black,width: 0.8))),
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.only(top:15.0),
      child: Row(
        children: <Widget>[
          forecast('Now', 27),
          forecast('2.00pm', 28),
          forecast('5.00pm', 27),
          forecast('8.00pm', 25),
          forecast('11.00pm', 23)
        ],
      ),
    );
  }
}