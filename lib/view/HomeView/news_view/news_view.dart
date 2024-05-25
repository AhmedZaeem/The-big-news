import 'package:big_news/controller/news_api_controller.dart';
import 'package:big_news/model/news_tile_model.dart';
import 'package:big_news/view/HomeView/news_view/news_tile.dart';
import 'package:flutter/material.dart';

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
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            newsTiles = snapshot.data as List<NewsTileModel>;
            return SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) => NewsTile(newsTile: newsTiles[index]),
              childCount: newsTiles.length,
            ));
          } else if (snapshot.error == 'no internet connection') {
            return SliverToBoxAdapter(
              child: Center(
                child: Icon(
                  Icons.error,
                  color: Colors.blue,
                ),
              ),
            );
          } else {
            print('error');
            return SliverToBoxAdapter(
              child: Center(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            );
          }
        });
  }
}
