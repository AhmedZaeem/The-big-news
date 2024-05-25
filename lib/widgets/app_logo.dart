import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'Big', style: Theme.of(context).textTheme.titleSmall),
          TextSpan(
              text: 'News',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.deepPurple[300])),
        ],
      ),
    );
  }
}
