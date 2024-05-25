import 'package:big_news/view/HomeView/category_view/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/category_provider.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    var categoryProvider = context.read<CategoryProvider>();
    var categories = categoryProvider.categories;

    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsetsDirectional.only(start: 16.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            CategoryCard(category: categories[index]),
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemCount: categories.length,
      ),
    );
  }
}
