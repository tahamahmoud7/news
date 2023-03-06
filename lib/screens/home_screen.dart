import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/models/categorieyData.dart';
import 'package:news/screens/tap_controller.dart';
import '../shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {
  CategoryData categoryData;

  HomeScreen(this.categoryData);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(categoryData.id,context),
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
              TextButton(onPressed: () {}, child: const Text("Try Again"))
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
        var sources = snapshot.data?.sources ?? [];
        return TapControllerScreen(sources);
      },
    );
  }
}
