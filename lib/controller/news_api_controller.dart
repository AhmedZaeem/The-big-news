import 'dart:convert';

import 'package:big_news/constants.dart';
import 'package:big_news/controller/internet_connection_controller.dart';
import 'package:big_news/controller/shared_preferences_controller.dart';
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
        var json = jsonEncode(response.data['articles']);
        await SharedPreferencesController()
            .setData(json, categoryProvider.selectedIndex);
        return toNewsList(json);
      } catch (e) {
        return [];
      }
    } else if (await SharedPreferencesController().getCatNum() != null &&
        await SharedPreferencesController().getJson() != null &&
        categoryProvider.selectedIndex ==
            await SharedPreferencesController().getCatNum()) {
      return toNewsList(await SharedPreferencesController().getJson());
    } else {
      return Future.error('no internet connection');
    }
  }

  toNewsList(String json) {
    List<dynamic> articles = jsonDecode(json);
    return articles
        .where((article) =>
            article['title'] != null &&
            article['title'].toString().toLowerCase() != '[removed]' &&
            article['urlToImage'] != null &&
            article['description'] != null)
        .map((article) => NewsTileModel.fromJson(article))
        .toList();
  }
}
