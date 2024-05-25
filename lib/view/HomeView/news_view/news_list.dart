import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/news_tile_model.dart';
import 'news_tile.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.newsTiles,
  });

  final List<NewsTileModel> newsTiles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) => GestureDetector(
        onTap: () {
          
        },
        child: NewsTile(newsTile: newsTiles[index]),
      ),
      childCount: newsTiles.length,
    ));
  }
}
