import 'package:flutter/material.dart';
import 'package:news/layout/Home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: HomeScreen.routeName,
      routes:{HomeScreen.routeName:(context)=>HomeScreen()

      } ,
      debugShowCheckedModeBanner: false,

    );
  }
}


