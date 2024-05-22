import 'package:big_news/Model/NewsTileModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.newsTile});
  final NewsTileModel newsTile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 16.h),
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/images/${newsTile.image}.jpeg',
            width: 100.w,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8.h),
                GradientAnimationText(
                  text: Text(
                    newsTile.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  colors: [
                    Colors.white,
                    Colors.deepPurple[300]!,
                    Colors.white,
                  ],
                  duration: const Duration(seconds: 3),
                ),
                SizedBox(height: 4.h),
                Text(
                  newsTile.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
