import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class RotatingContainerPage extends StatelessWidget {
  const RotatingContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: _RotatingContainer(),
        ),
      ),
    );
  }
}

class _RotatingContainer extends StatefulWidget {
  const _RotatingContainer({super.key});

  @override
  State<_RotatingContainer> createState() => _RotatingContainerState();
}

class _RotatingContainerState extends State<_RotatingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..rotateZ(_animation.value),
          child: child,
        );
      },
      child: Material(
        elevation: 4,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
