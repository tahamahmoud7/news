import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/NewsDataModel.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = "NewsDetails";

  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(color: Colors.black)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                imageUrl: articles.urlToImage ?? "",
                height: 180,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              // Image.network(
              //   articles.urlToImage ?? "",
              //   height: 180,
              //   fit: BoxFit.fill,
              // ),
              Text(articles.author ?? "",
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500)),
              Text(articles.title ?? "",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text(
                articles.publishedAt?.substring(0, 10) ?? "",
                textAlign: TextAlign.right,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(articles.description ?? ""),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      openUrl(articles.url);

                    },
                    icon: const Text("view full artical",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    label: const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                      size: 30,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
  void openUrl(String? url)async{
    if(url==null){
      return;
    }
    var uri=Uri.parse(url);
  if(await canLaunchUrl(uri)){
await launchUrl(uri);
  }
  }
}
