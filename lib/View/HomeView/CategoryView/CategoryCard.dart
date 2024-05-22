import 'package:big_news/Model/CategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatefulWidget {
  final CategoryModel category;
  final int selectedIndex;
  const CategoryCard(
      {super.key, required this.category, required this.selectedIndex});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: 120.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.selectedIndex == widget.category.index
                ? Colors.deepPurple[300]!
                : Theme.of(context).scaffoldBackgroundColor,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
          image: DecorationImage(
            opacity: .5,
            image: AssetImage(
              'assets/images/${widget.category.imageSource}.jpeg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Text(widget.category.categoryTitle,
            style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
