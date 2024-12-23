import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/shared/constants/constants.dart'; //This import must imported manually

class ApiManager {


  static Future<SourcesResponse> getSources() async {
    //.get needs a type uri, when created a variable URL we defined http or https depends on the API Url
    /*Authority is the base Url,
    UnencodedPath is the end point,
    then put the apiKey as a amp of string & dynamic*/
    Uri URL = Uri.https(BASE_URL, "/v2/top-headlines/sources", {"apiKey": APIKey});
    try {
      http.Response sources = await http.get(URL);
      var json = jsonDecode(sources.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsDataModel> getNewsData(String sourceId) async{
    Uri URL = Uri.https(BASE_URL, '/v2/everything', {'apiKey': APIKey, 'sources': sourceId});
    Response response = await http.get(URL);
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson((json));
    return newsDataModel;

  }
}
