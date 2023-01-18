import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/categorieyData.dart';
import 'package:news/screens/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  Function onCategorySelect;
  CategoriesScreen(this.onCategorySelect);

  @override
  Widget build(BuildContext context) {
    var categories = CategoryData.getCategories();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height:10),
          const Text("Pike Your Categoriey of interest",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height:10),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: (){
                      onCategorySelect(categories[index]);
                    },
                    child:CategoryItem(categories[index], index));
              },
            ),
          )
        ],
      ),
    );
  }
}
