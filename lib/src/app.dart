import 'package:flutter/material.dart';
import './screens/home_screen.dart';

class App extends StatelessWidget{
  @override
  
  Widget build(BuildContext context) {
    var hour = DateTime.now().hour;
    String imgUrl;
    if(hour > 5 && hour < 8){
      //sunrise
      imgUrl = 'assets/images/sunrise.jpeg';
    }else if (hour >= 8 && hour < 17){
      //day
       imgUrl = 'assets/images/day.jpg';
    }else if(hour >= 17 && hour < 20){
      //sunset
       imgUrl = 'assets/images/sunset.jpeg';
    }else{
      //night
      imgUrl = 'assets/images/night.jpeg';
    }
    return MaterialApp(
      title: '24 weather',
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image:  DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.fill,),
              ),
            ),
            Center(
              child :HomeScreen(),
            )
          ],
        )
      )
    );
  }
}

/*day
''
//night
''
*/