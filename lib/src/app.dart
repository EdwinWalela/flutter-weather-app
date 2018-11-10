import 'package:flutter/material.dart';

import './screens/home_screen.dart';

class App extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home:Scaffold(
        appBar:AppBar(
          title:Text(
            'Nairobi',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1.6
              ),
            ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.3,
        ),
      body: HomeScreen(),
      )
    );
  }
}