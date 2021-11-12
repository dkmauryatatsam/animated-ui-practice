import 'dart:math';

import 'package:flutter/material.dart';

const double buttonSize = 60;

class AnimatedExpandedFAB extends StatefulWidget {
  const AnimatedExpandedFAB({Key? key}) : super(key: key);

  @override
  State<AnimatedExpandedFAB> createState() => _AnimatedExpandedFABState();
}

class _AnimatedExpandedFABState extends State<AnimatedExpandedFAB>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isOpen = true;
        });
      } else {
        setState(() {
          isOpen = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Flow(
        delegate: FlowMenuDelegate(controller: controller),
        children: <IconData>[
          Icons.mail,
          Icons.call,
          Icons.notifications,
          Icons.sms,
          Icons.menu
        ].map<Widget>(buildFab).toList(),
      );

  Widget buildFab(IconData icon) {
    return SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: FloatingActionButton(
        elevation: 0,
        splashColor: Colors.black,
        child: Icon(
          icon,
          color: Colors.white,
          size: 45,
        ),
        onPressed: () {
          isOpen ? controller.reverse() : controller.forward();
        },
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;
  FlowMenuDelegate({
    required this.controller,
  });
  @override
  void paintChildren(FlowPaintingContext context) {
    final n = context.childCount;
    for (int i = 0; i < n; i++) {
      bool isLastItem = i == n - 1;
      final setValue = (value) => isLastItem ? 0.0 : value;
      final radius = 180 * controller.value;
      final theta = i * pi * 0.5 / (n - 2);
      final x = setValue(radius * cos(theta));
      final y = setValue(radius * sin(theta));
      context.paintChild(
        i,
        transform: Matrix4.identity()..translate(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
