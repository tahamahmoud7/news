import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawarScreen extends StatelessWidget {
  Function OnDrawarSelected;
  DrawarScreen(this.OnDrawarSelected);
  static const int CATEGORIES=1;
  static const int SETTINGS=2;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        Container(
          color: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: const Text("App News",style: TextStyle(color: Colors.white,fontSize: 30,),textAlign: TextAlign.center),
        ),const SizedBox(height: 10,),

            InkWell(
              onTap: (){
                OnDrawarSelected(CATEGORIES);
              },
              child:  const Text(
                "categories",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ), const SizedBox(height: 10,),
        InkWell(
          onTap: (){
            OnDrawarSelected(SETTINGS);

          },
          child: const Text(
            "settings",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
