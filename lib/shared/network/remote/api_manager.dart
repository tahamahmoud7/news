import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:news/shared/compnents/compnets.dart';
import '../../../models/SourcesResponse.dart';
import '../../styles/constasnts/constants.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String id, BuildContext context,
      {String? categoryId, String? searchKeyword}) async {
    var URL = Uri.https(BASE, "v2/top-headlines/sources",
        {"apiKey": APIKEY, "category": categoryId, "q": searchKeyword});

    Response? sources;
    try {
      sources = await http.get(URL);
      print(sources.statusCode);
    } catch (e) {
      showMessage(context, "Error", "ok", () {
        Navigator.pop(context);
      });
    }
    var json = jsonDecode(sources!.body);
    SourcesResponse sourcesRespons = SourcesResponse.fromJson(json);
    return sourcesRespons;
  }

  static Future<NewsDataModel> getNewsData(
      {String? sourceId, String? searchKeyword}) async {
    Uri URL = Uri.https(BASE, '/v2/everything', {
      "apiKey": APIKEY,
      "sources": sourceId,
      "q": searchKeyword,
    });
    Response response = await http.get(URL);
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }
}
