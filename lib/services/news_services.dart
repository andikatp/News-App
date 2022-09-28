import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model/news_response_model.dart';

class NewsServices {
  static Future<List<Articles>> getNews(String category) async {
    var response = await get(Uri.parse(
        'https://saurav.tech/NewsAPI/top-headlines/category/${category.toLowerCase()}/in.json'));
    var decodeResponse = jsonDecode(response.body);
    var newsResponse = NewsResponseModel.fromJson(decodeResponse);
    if (newsResponse.articles == null) throw 'error artikel tidak diterima';
    return newsResponse.articles!;
  }
}
