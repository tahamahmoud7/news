import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/categorieyData.dart';

class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int index;
  CategoryItem(this.categoryData, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: categoryData.color,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25),
              bottomLeft:
                  index.isEven ? const Radius.circular(25) : Radius.zero,
              bottomRight:
                  index.isOdd ? const Radius.circular(25) : Radius.zero,
            )),
        child: Column(
          children: [
            Image.asset(categoryData.image, height: 120, fit: BoxFit.fill),
            Expanded(child: Center(child: Text(categoryData.title,style: const TextStyle(color: Colors.white,
             fontWeight: FontWeight.bold,fontSize: 20
            ),)))
          ],
        ));
  }
}
