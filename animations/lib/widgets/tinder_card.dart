import 'dart:math';

import 'package:animations/controller/tinder_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TinderCard extends StatefulWidget {
  const TinderCard({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);
  final String imgUrl;
  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  TinderController controller = Get.put(TinderController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      controller.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: buildFrontCard(),
    );
  }

  Widget buildFrontCard() => GestureDetector(
        child: Obx(() {
          final milliSecond = controller.isDragging.value ? 0 : 400;
          final position = controller.position.value;
          final angle = controller.angle.value * pi / 180;
          final rotatedMatrix = Matrix4.identity()..rotateZ(angle);
          return AnimatedContainer(
              duration: Duration(milliseconds: milliSecond),
              curve: Curves.easeInOut,
              transform: Matrix4.identity()
                ..translate(position.dx, position.dy),
              child: buildCard());
        }),
        onPanStart: (detail) {
          controller.startPosition(detail);
        },
        onPanUpdate: (detail) {
          controller.updatePosition(detail);
        },
        onPanEnd: (detail) {
          controller.endPosition();
        },
      );

  Widget buildCard() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(widget.imgUrl), fit: BoxFit.cover),
        ),
      );
}
