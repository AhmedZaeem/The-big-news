import 'package:big_news/model/news_tile_model.dart';
import 'package:big_news/view/HomeView/HomeView.dart';
import 'package:big_news/helpers/NavigationHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';

import '../controller/news_api_controller.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with Navigationhelper {
  Future startApp() async {
    Future.delayed(const Duration(milliseconds: 500),
        () => jmp(context, to: const HomeView(), withReplace: true));
  }

  @override
  void initState() {
    super.initState();
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GradientAnimationText(
          text:
              Text('BigNews', style: Theme.of(context).textTheme.displayLarge),
          colors: const [
            Colors.grey,
            Colors.white,
          ],
          duration: const Duration(
            milliseconds: 500,
          ),
        ),
      ),
    );
  }
}
