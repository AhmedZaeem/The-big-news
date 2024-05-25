import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgets/my_shimmer.dart';

class LoadingData extends StatelessWidget {
  const LoadingData({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding:
              EdgeInsetsDirectional.only(bottom: 8.h, start: 16.w, end: 16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const MyShimmer(width: 100, height: 60),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 12.h),
                  const MyShimmer(width: 160, height: 11),
                  SizedBox(height: 4.h),
                  const MyShimmer(width: 190, height: 10),
                  SizedBox(height: 2.h),
                  const MyShimmer(width: 150, height: 6),
                ],
              ),
            ],
          ),
        ),
        childCount: 15,
      ),
    );
  }
}
