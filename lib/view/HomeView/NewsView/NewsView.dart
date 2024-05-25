import 'package:big_news/model/news_tile_model.dart';
import 'package:big_news/view/HomeView/NewsView/NewsTile.dart';
import 'package:flutter/material.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key, required this.newsTiles});
  final List<NewsTileModel> newsTiles;
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) => NewsTile(newsTile: widget.newsTiles[index + 1]),
      childCount: widget.newsTiles.length - 1,
    ));
  }
}
