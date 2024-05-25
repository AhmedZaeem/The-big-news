import 'package:big_news/constants.dart';
import 'package:big_news/model/news_tile_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/category_provider.dart';

class NewsApiController {
  final Dio dio = Dio();
  getNews(BuildContext context) async {
    var categoryProvider = context.watch<CategoryProvider>();
    String url = baseUrl +
        categoryProvider
            .categories[categoryProvider.selectedIndex].categoryTitle;
    Response response =
        await dio.get(url, options: Options(headers: {'Authorization': token}));
    try {
      if (response.statusCode == 200) {
        List<dynamic> articles = response.data['articles'];
        List<NewsTileModel> newsTiles = [];
        for (Map<String, dynamic> article in articles) {
          if (article['title'] != null &&
              article['title'].toString().toLowerCase() != '[removed]' &&
              article['urlToImage'] != null &&
              article['description'] != null) {
            NewsTileModel newsTile = NewsTileModel.fromJson(article);
            newsTiles.add(newsTile);
          }
        }
        return newsTiles;
      } else {
        return [];
      }
    } catch (e) {
      return Future.error('error');
    }
  }
}
