import 'package:big_news/view/HomeView/AppBar.dart';
import 'package:big_news/view/HomeView/NewsView/NewsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/news_tile_model.dart';
import 'CategoryView/CategoryList.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.newsTiles});
  final List<NewsTileModel> newsTiles;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const MyAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: CategoryList(),
            ),
          ),
          NewsView(newsTiles: widget.newsTiles)
        ],
      ),
    );
  }
}
