import 'package:big_news/constants.dart';
import 'package:big_news/controller/internet_connection_controller.dart';
import 'package:big_news/model/news_tile_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/category_provider.dart';

class NewsApiController {
  final Dio dio = Dio();

  Future<List<NewsTileModel>> getNews(BuildContext context) async {
    var categoryProvider = context.watch<CategoryProvider>();
    String url = baseUrl +
        categoryProvider
            .categories[categoryProvider.selectedIndex].categoryTitle;

    if (await InternetConnectionController().isConnected()) {
      try {
        Response response = await dio.get(url,
            options: Options(headers: {'Authorization': token}));
        if (response.statusCode != 200) return [];

        List<dynamic> articles = response.data['articles'];
        return articles
            .where((article) =>
                article['title'] != null &&
                article['title'].toString().toLowerCase() != '[removed]' &&
                article['urlToImage'] != null &&
                article['description'] != null)
            .map((article) => NewsTileModel.fromJson(article))
            .toList();
      } catch (e) {
        return [];
      }
    } else {
      return Future.error('no internet connection');
    }
  }
}
