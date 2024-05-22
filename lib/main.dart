import 'package:big_news/View/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            displayLarge: const TextStyle(fontFamily: 'Newtype'),
            titleSmall: TextStyle(
              fontFamily: 'Newtype',
              fontSize: 24.sp,
            ),
            titleMedium: TextStyle(
              fontFamily: 'Newtype',
              fontSize: 16.sp,
              color: Colors.grey[300],
            ),
            titleLarge: TextStyle(
              fontSize: 18.sp,
              fontFamily: 'Newtype',
            ),
            bodySmall: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey[300]!,
            ),
          ),
        ),
        title: 'BigNews',
        home: const Splashscreen(),
      ),
    );
  }
}
