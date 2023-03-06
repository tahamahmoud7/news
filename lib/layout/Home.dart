import 'package:flutter/material.dart';
import 'package:news/models/categorieyData.dart';
import '../screens/Drawar_screen.dart';
import '../screens/categories.dart';
import '../screens/home_screen.dart';
import '../news_search/news_search.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeLayout> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeLayout> {
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
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: NewsSearch());
                    },
                    icon: const Icon(Icons.search))
              ],
              backgroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
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

  CategoryData? categoryData;

  void OnDrawarSelected(number) {
    if (number == DrawarScreen.CATEGORIES) {
      categoryData = null;
    } else if (number == DrawarScreen.SETTINGS) {
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
