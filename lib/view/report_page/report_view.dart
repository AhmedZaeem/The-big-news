import 'package:big_news/model/news_tile_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key , required this.report});
  final NewsTileModel report;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
      children: [
        SizedBox(height: 16.h),
        Text(report.title,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.deepPurple.shade200)),
        SizedBox(height: 24.h),
        CachedNetworkImage(
            imageUrl: report.image,
            width: 100.w,
            fit: BoxFit.contain,
            placeholder: (context, url) =>
                Image.asset('assets/images/loading.gif', width: double.infinity,height: 400.h,),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          SizedBox(height: 4.h),
          report.sourceName == '' ? const SizedBox.shrink():
          Text('By ${report.sourceName}',style: Theme.of(context).textTheme.displaySmall),
          SizedBox(height: 24.h),
          Text(report.description,style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 8.h),
          Text(report.content,style: Theme.of(context).textTheme.bodyMedium),
      ],
    ),
    );
  }
}