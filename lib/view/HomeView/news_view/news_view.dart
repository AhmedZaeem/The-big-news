import 'package:big_news/controller/news_api_controller.dart';
import 'package:big_news/model/news_tile_model.dart';
import 'package:big_news/view/place_holders/error_view.dart';
import 'package:big_news/view/place_holders/loading_data.dart';
import 'package:flutter/material.dart';

import 'news_list.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  List<NewsTileModel> newsTiles = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NewsApiController().getNews(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingData();
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            newsTiles = snapshot.data as List<NewsTileModel>;
            return NewsList(newsTiles: newsTiles);
          } else {
            return  ErrorView(wifiError: snapshot.error == 'no internet connection');
          }

        });
  }
}
