import 'package:big_news/constants.dart';
import 'package:big_news/model/news_tile_model.dart';
import 'package:dio/dio.dart';

class NewsApiController {
  final Dio dio = Dio();
  getNews() async {
    Response response = await dio.get(baseUrl,
        options: Options(headers: {'Authorization': token}));
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
