import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    setRotaion(10);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _controller.repeat();
    });
  }

  void setAnimation() {
    _controller.addStatusListener((status) async {
      await Future.delayed(const Duration(milliseconds: 500));
      if (AnimationStatus.completed == status) {
        _controller.reverse();
      }
      await Future.delayed(const Duration(milliseconds: 500));
      if (AnimationStatus.completed != status) {
        _controller.forward();
      }
    });
  }

  void setRotaion(int degree) {
    final angle = degree * pi / 180;
    animation = Tween<double>(begin: -angle, end: angle).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: animation,
                child: GestureDetector(
                  onTap: () {
                    _controller.forward();
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Center(
                      child: Text('Click Me'),
                    ),
                  ),
                ),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: animation.value,
                    child: child,
                  );
                })
          ],
        ),
      ),
    );
  }
}
