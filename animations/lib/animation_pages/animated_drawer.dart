import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedDrawer extends StatefulWidget {
  const AnimatedDrawer({Key? key}) : super(key: key);

  @override
  _AnimatedDrawerState createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  @override
  Widget build(BuildContext context) {
    double maxSlide = 225.0;
    var myDrawer = Container(
      color: Colors.blue,
    );
    var myChild = Container(
      color: Colors.yellow,
    );
    return GestureDetector(
      onTap: toggle,
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            double slide = maxSlide * animationController.value;
            double scale = 1 - (animationController.value * 0.3);
            return Stack(
              children: [
                myDrawer,
                Transform(
                  transform: Matrix4.identity()
                    ..rotateY(-pi / 2 * animationController.value),
                  // ..scale(scale)
                  // ..translate(slide),
                  alignment: Alignment.centerLeft,
                  child: myChild,
                )
              ],
            );
          }),
    );
  }
}
