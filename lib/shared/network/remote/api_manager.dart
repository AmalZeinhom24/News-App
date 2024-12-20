import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/SourcesResponse.dart'; //This import must imported manually

class ApiManager {
  static Future<SourcesResponse> getSources() async {
    //.get needs a type uri, when created a variable url we defined http or https depends on the API Url
    /*Authority is the base Url,
    UnencodedPath is the end point,
    then put the apiKey as a amp of string & dynamic*/
    try {
      Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
          {"apiKey": "754e6dfb91be45df9cc8fd875d7b3ad9"});

      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonData);
      return sourcesResponse;
    } catch (e) {
      throw Exception();
    }
  }
}
