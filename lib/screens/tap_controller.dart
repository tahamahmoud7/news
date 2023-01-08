import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';

import 'package:news/screens/tab_item.dart';
import 'package:news/shared/network/remote/api_manager.dart';
import '../models/SourcesResponse.dart';
import 'news_card.dart';

class TapControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TapControllerScreen(this.sources);

  @override
  State<TapControllerScreen> createState() => _TapControllerScreenState();
}

class _TapControllerScreenState extends State<TapControllerScreen> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              isScrollable: true,
              onTap: (index) {
                selectIndex = index;
                setState(() {

                });
              },
              tabs: widget.sources
                  .map((source) => Tab(
                        child: TabItem(
                            source, widget.sources.indexOf(source) == selectIndex),
                      ))
                  .toList(),
            )),
        FutureBuilder<NewsDataModel>(
          future: ApiManager.getNewsData(widget.sources[selectIndex].id ?? ""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.green,));
            }
            if (snapshot.hasError) {
              return Column(children: [
                Text(snapshot.data?.message ?? "Has Error"),
                TextButton(onPressed: () {}, child:  Text("Try Again"))
              ],);
            }
            if(snapshot.data?.status!="ok"){
              Column(children: [
                Text(snapshot.data?.message ?? "Has Error"),
                TextButton(onPressed: () {}, child: const Text("Try Again"))
              ],);
            }
            var news=snapshot.data?.articles??[];
            return Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return NewsCard(news[index]);
              },
              itemCount: news.length,),
            );
          },)
      ],
    );
  }
}
