import 'package:big_news/model/news_tile_model.dart';
import 'package:big_news/view/report_page/report_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.newsTile});
  final NewsTileModel newsTile;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReportView(report: newsTile)));
      },
      child: Padding(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 16.h),
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: newsTile.image,
            width: 100.w,
            fit: BoxFit.fitWidth,
            placeholder: (context, url) =>
                Image.asset('assets/images/loading.gif', width: 100.w),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 2.h),
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
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
