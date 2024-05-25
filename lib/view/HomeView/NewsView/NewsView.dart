import 'package:big_news/controller/news_api_controller.dart';
import 'package:big_news/model/news_tile_model.dart';
import 'package:big_news/providers/category_provider.dart';
import 'package:big_news/view/HomeView/NewsView/NewsTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  List<NewsTileModel> newsTiles = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        return FutureBuilder(
            future: NewsApiController().getNews(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError || newsTiles == []) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('Error'),
                  ),
                );
              }
              if (snapshot.hasData) {
                newsTiles = snapshot.data as List<NewsTileModel>;
              }
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) => NewsTile(newsTile: newsTiles[index]),
                childCount: newsTiles.length,
              ));
            });
      },
    );
  }
}
