import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(Assets.images.appIcon.path), fit: BoxFit.cover, width: 200),
          const Text('HomePage'),
        ],
      ),
    );
  }
}
