import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/NewsDataModel.dart';
import '../../../models/SourcesResponse.dart';
import '../../styles/constasnts/constants.dart';

class ApiManager {


  static Future<SourcesResponse> getSources() async {
    var URL = Uri.https(BASE, "v2/top-headlines/sources",
        {"apiKey": APIKEY});

    Response? sources;
    try {
     Response sources = await http.get(URL);
     var json = jsonDecode(sources.body);
     SourcesResponse sourcesRespons = SourcesResponse.fromJson(json);
     return sourcesRespons;

    } catch (e){
      throw e;
    }


  }

  static Future<NewsDataModel> getNewsData(String sourceId)async{
    Uri URL=Uri.https(BASE, '/v2/everything',{
"apiKey":APIKEY,
      "sources":sourceId,
    });
   Response response=await http.get(URL);
  var json =jsonDecode(response.body);
  NewsDataModel newsDataModel= NewsDataModel.fromJson(json);
  return newsDataModel;
  }
}
