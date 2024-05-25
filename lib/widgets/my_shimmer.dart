import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  const MyShimmer({
    super.key,
    required this.width,
    required this.height,
  });
  final int width;
  final int height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white12,
      period: const Duration(milliseconds: 500),
      highlightColor: Colors.grey.shade600,
      child: Container(
        width: width.w,
        height: height.h,
        color: Colors.white,
      ),
    );
  }
}
