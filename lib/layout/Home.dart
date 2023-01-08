import 'package:flutter/material.dart';
import 'package:news/screens/tap_controller.dart';
import '../models/SourcesResponse.dart';
import '../shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

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
            backgroundColor: const Color.fromRGBO(57, 165, 82, 1.0),
            shape: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(
                      30,
                    ))),
            title: const Text("News")),
        body: FutureBuilder<SourcesResponse>(
          future: ApiManager.getSources(),
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
        ),
      ),
    );
  }
}
