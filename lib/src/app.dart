import 'package:flutter/material.dart';
import './screens/home_screen.dart';

class App extends StatelessWidget{
  @override
  
  Widget build(BuildContext context) {
    var hour = DateTime.now().hour;
    String imgUrl;
    if(hour > 6 && hour < 18 ){
     imgUrl = 'assets/images/day.jpg';
    }else{
     imgUrl = 'assets/images/night.jpg';
    }
    return MaterialApp(
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