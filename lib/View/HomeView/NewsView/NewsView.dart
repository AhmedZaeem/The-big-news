import 'package:big_news/Model/NewsTileModel.dart';
import 'package:big_news/View/HomeView/NewsView/NewsTile.dart';
import 'package:flutter/material.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  List newsTile = List.generate(
      20,
      (index) => NewsTileModel(
          title: 'title', description: 'description', image: 'business'));
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) => NewsTile(newsTile: newsTile[index]),
      childCount: 15,
    ));
  }
}
