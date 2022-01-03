import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ShakeAnimation extends StatefulWidget {
  const ShakeAnimation({Key? key}) : super(key: key);

  @override
  State<ShakeAnimation> createState() => _ShakeAnimationState();
}

class _ShakeAnimationState extends State<ShakeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    offsetAnimation = Tween(begin: 0.0, end: 30.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
    Timer mytimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: offsetAnimation,
                builder: (context, child) {
                  return Transform.translate(
                      offset: Offset(0, offsetAnimation.value + 30),
                      child: Transform.translate(
                          offset: Offset(0, -30 + offsetAnimation.value),
                          child: Pulse(
                              duration: const Duration(milliseconds: 800),
                              child: square(Colors.black, "ShakeY"))));
                }),

            // Flash(child: square(Colors.red, "red")),
            // FlipInY(child: square(Colors.green, "green")),
            // FadeInDown(child: square(Colors.blue, "blue")),
            // FadeInRight(child: square(Colors.amber, "amber")),
          ],
        ),
      ),
    );
  }

  Widget square(Color color, String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 130,
        color: color,
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
