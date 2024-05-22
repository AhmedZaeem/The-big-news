import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Big',style: Theme.of(context).textTheme.titleSmall),
              TextSpan(text: 'News',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.deepPurple[300])),
            ],
          ),
        ),
      ),
    );
  }
}
