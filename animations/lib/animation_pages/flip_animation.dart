import 'dart:math';

import 'package:flutter/material.dart';

class FlipAnimation extends StatefulWidget {
  const FlipAnimation({Key? key}) : super(key: key);

  @override
  _FlipAnimationState createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation rotationAnimation;
  late bool _displayFront;

  @override
  void initState() {
    super.initState();
    _displayFront = true;
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    rotationAnimation = Tween(begin: pi, end: 0.0).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: rotationAnimation,
          child: Center(child: _buildFlipAnimation()),
          builder: (context, child) {
            return Transform(
              transform: Matrix4.rotationY(-rotationAnimation.value),
              child: child,
              alignment: Alignment.center,
            );
          }),
    );
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: () => setState(() {
        _displayFront
            ? animationController.forward()
            : animationController.reverse();
        _displayFront = !_displayFront;
      }),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        child: _displayFront ? _buildFront() : _buildBack(),
      ),
    );
  }

  Widget _buildFront() {
    return Container(
      key: ValueKey("1"),
      height: 200,
      width: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/2.jpg'), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildBack() {
    return Container(
      key: ValueKey("2"),
      height: 200,
      width: 200,
      decoration: const BoxDecoration(color: Colors.black),
      child: const Center(
        child: Text(
          "Name",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
