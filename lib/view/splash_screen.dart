import 'package:big_news/controller/internet_connection_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';

import 'home_view/HomeView.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeView())));
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
