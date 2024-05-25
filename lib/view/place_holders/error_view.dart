import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorView extends StatefulWidget {
  const ErrorView({super.key, this.wifiError = false});
  final bool wifiError;

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 150.h),
          GradientAnimationText(
            text: Text(
              'An error had occurred',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18.sp),
            ),
            colors: [
              Colors.white,
              Colors.deepPurple[300]!,
              Colors.white,
            ],
            duration: const Duration(seconds: 3),
          ),
          SizedBox(height: 16.h),
          widget.wifiError
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      Text(
                        'Looks like you have no internet connection at the moment please check you connection and try again later',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 12.sp),
                      ),
                      Icon(
                        Icons.signal_wifi_connected_no_internet_4,
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'An unknown error had occurred please try again another time later or contact support',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 12.sp),
                  ),
                ),
        ],
      ),
    );
  }
}
