import 'package:flutter/material.dart';
import 'package:flutter_animations/rotate_and_flip_chained_animation_page.dart';
import 'package:flutter_animations/rotating_container_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RotateAndFlipChainedAnimationPage(),
    );
  }
}
