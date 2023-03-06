import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';
import '../layout/details/news_details.dart';

class NewsCard extends StatelessWidget {
  Articles articles;

  NewsCard(this.articles);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(NewsDetails.routeName, arguments: articles),
      child: Container(
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
            )
          ],
        ),
      ),
    );
  }
}
