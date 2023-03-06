import 'package:flutter/material.dart';
import '../models/NewsDataModel.dart';
import '../screens/news_card.dart';
import '../shared/network/remote/api_manager.dart';

class NewsSearch extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(
            Icons.search,
            size: 25,
          ))
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.clear,
          size: 25,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {

    return FutureBuilder<NewsDataModel>(
      future: ApiManager.getNewsData(searchKeyword: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          ));
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.data?.message ?? "Has Error"),
              TextButton(onPressed: () {}, child: Text("Try Again"))
            ],
          );
        }
        if (snapshot.data?.status != "ok") {
          Column(
            children: [
              Text(snapshot.data?.message ?? "Has Error"),
              TextButton(onPressed: () {}, child: const Text("Try Again"))
            ],
          );
        }
        var news = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NewsCard(news[index]);
            },
            itemCount: news.length,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text("Suggestions"));
  }
}
