import 'package:big_news/model/category_model.dart';
import 'package:big_news/view/HomeView/CategoryView/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List categories = List.generate(
      5,
      (index) => CategoryModel(
          categoryTitle: 'Business', index: index, imageSource: 'business'));
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsetsDirectional.only(start: 16.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            CategoryCard(category: categories[index], selectedIndex: 0),
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemCount: categories.length,
      ),
    );
  }
}
