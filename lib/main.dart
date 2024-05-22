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
              displayLarge: const TextStyle(
                  fontFamily: 'Newtype'
              ),
              titleSmall: TextStyle(
                fontFamily: 'Newtype',
                fontSize: 24.sp,
              ),
            ),
          ),
          title: 'BigNews',
          home: const Splashscreen()
      ),
    );
  }
}
