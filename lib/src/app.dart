import 'package:flutter/material.dart';
import './screens/home_screen.dart';

class App extends StatelessWidget{
  @override
  
  Widget build(BuildContext context) {
    var hour = DateTime.now().hour;
    String imgUrl;
    if(hour > 6 && hour < 18 ){
     imgUrl = 'https://images.unsplash.com/photo-1446435210126-bfa18ee3b7a1?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3566466d76117e29ffb4160a639748fb&auto=format&fit=crop&w=1202&q=80';
    }else{
     imgUrl = 'https://images.pexels.com/photos/176851/pexels-photo-176851.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image:  DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.fill,),
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