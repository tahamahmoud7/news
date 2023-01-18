import 'package:flutter/material.dart';

class NewsSearch extends SearchDelegate {  @override
  List<Widget>? buildActions(BuildContext context) {
  return [IconButton(onPressed: (){}, icon: const Icon(Icons.search,size: 25,)) ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){}, icon: const Icon(Icons.clear,size: 25,));
  }

  @override
  Widget buildResults(BuildContext context) {
  return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return const Center(child: Text("Suggestions"));
  }
}
