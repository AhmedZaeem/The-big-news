import 'package:big_news/View/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Newtype'

          ),
        ),
      ),
      title: 'Material App',
      home: Splashscreen()
    );
  }
}
