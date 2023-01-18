import 'package:flutter/material.dart';
import 'package:news/layout/Home.dart';
import 'layout/details/news_details.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: Home.routeName,
      routes:{Home.routeName:(context)=>Home(),
        NewsDetails.routeName:(context) => NewsDetails()
      } ,
      debugShowCheckedModeBanner: false,

    );
  }
}


