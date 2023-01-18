import 'package:flutter/material.dart';
import 'package:news/models/categorieyData.dart';
import '../screens/Drawar_screen.dart';
import '../screens/categories.dart';
import '../screens/home_screen.dart';
import 'details/news_search.dart';
class Home extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [IconButton(onPressed: (){
            showSearch(context: context, delegate: NewsSearch(
            ));
              
            }, icon: Icon(Icons.search))],
              backgroundColor: const Color.fromRGBO(57, 165, 82, 1.0),
              shape: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(
                        30,
                      ))),
              title: const Text("News")),
          drawer: DrawarScreen(OnDrawarSelected),
          body: categoryData == null
              ? CategoriesScreen(onCategorySelected)
              : HomeScreen(categoryData!)),
    );
  }

  CategoryData? categoryData = null;

  void OnDrawarSelected(number) {
    if (number == DrawarScreen.CATEGORIES) {
      categoryData = null;
    } else if (number ==DrawarScreen.SETTINGS) {
//open setting screen
    }
    setState(() {
      Navigator.pop(context);
    });
  }

  void onCategorySelected(categorySelected) {
    categoryData = categorySelected;
    setState(() {});
  }
}
