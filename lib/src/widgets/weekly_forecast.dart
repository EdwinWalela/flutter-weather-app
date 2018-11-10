import 'package:flutter/material.dart';

class WeeklyForecast extends StatelessWidget {

  Widget forecast(String day,int tempLow,int tempHigh){
    return Container(
      margin: EdgeInsets.only(left:20.0,right:20.0,bottom: 10.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(
            color: Colors.black,
            width: 0.8
          )
        )
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
                '$day',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 1.0
                ),
              ),
            ),
            Expanded(
              child: Text(
                '$tempHigh / $tempLow',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 1.0
                )),
            )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        forecast('Tomorrow,Nov 10', 18, 27),
        forecast('Tomorrow,Nov 10', 18, 27),
        forecast('Tomorrow,Nov 10', 18, 27),
        forecast('Tomorrow,Nov 10', 18, 27),
    ]);
  }
}