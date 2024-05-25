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
  startApp() async {
    bool connected = await InternetConnectionController().isConnected();
    if (context.mounted) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (connected) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeView()));
        } else {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('No Internet Connection'),
              content: const Text('Please check your internet connection'),
              actions: [
                TextButton(
                  onPressed: () {
                    startApp();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
      });
    }
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
