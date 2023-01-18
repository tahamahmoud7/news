import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/categorieyData.dart';
import 'package:news/screens/tap_controller.dart';

import '../models/SourcesResponse.dart';
import '../shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {

CategoryData categoryData;

HomeScreen(this.categoryData);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(categoryData.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text(snapshot.data?.message ?? "");
        }
        if (snapshot.data?.status != "ok") {
          return Center(child: Text(snapshot.data!.message!));
        }
        var sources = snapshot.data?.sources ?? [];
        return TapControllerScreen(sources);
      },
    );
  }

}
