import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawarScreen extends StatelessWidget {
  Function OnDrawarSelected;

  DrawarScreen(this.OnDrawarSelected);

  static const int CATEGORIES = 1;
  static const int SETTINGS = 2;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: const Text("App News",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
              textAlign: TextAlign.center),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                OnDrawarSelected(CATEGORIES);
              },
              child: const Text(
                "categories",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            const Icon(Icons.category)
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            OnDrawarSelected(SETTINGS);
          },
          child: Row(
            children: const [
              Text(
                "settings",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.settings)
            ],
          ),
        ),

      ]),
    );
  }
}
