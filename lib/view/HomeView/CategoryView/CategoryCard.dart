import 'package:big_news/model/category_model.dart';
import 'package:big_news/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () => provider.changeCategory(category),
          child: Container(
            alignment: Alignment.center,
            width: 120.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: provider.selectedIndex == category.index
                    ? Colors.deepPurple[300]!
                    : Theme.of(context).scaffoldBackgroundColor,
                width: 2.w,
              ),
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                opacity: .5,
                image: AssetImage(
                  'assets/images/${category.imageSource}',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Text(category.categoryTitle,
                style: Theme.of(context).textTheme.titleMedium),
          ),
        );
      },
    );
  }
}
