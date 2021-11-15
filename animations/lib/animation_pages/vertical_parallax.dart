import 'package:flutter/material.dart';

import 'package:animations/data/gameData.dart';

class VerticalParallax extends StatefulWidget {
  const VerticalParallax({Key? key}) : super(key: key);

  @override
  _VerticalParallaxState createState() => _VerticalParallaxState();
}

class _VerticalParallaxState extends State<VerticalParallax> {
  late PageController pageController;
  double offset = 0;
  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.6);
    pageController.addListener(() {
      setState(() {
        offset = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: pageController,
        pageSnapping: false,
        itemCount: gamedata.length,
        itemBuilder: (context, index) {
          return ParallaxContainer(
              gameName: gamedata[index]['gameName'],
              imagePath: gamedata[index]['imagePath'],
              offset: offset,
              i: index.toDouble());
        },
      ),
    );
  }
}

class ParallaxContainer extends StatefulWidget {
  const ParallaxContainer({
    Key? key,
    required this.gameName,
    required this.imagePath,
    required this.offset,
    required this.i,
  }) : super(key: key);
  final String gameName;
  final String imagePath;
  final double offset;
  final double i;
  @override
  _ParallaxContainerState createState() => _ParallaxContainerState();
}

class _ParallaxContainerState extends State<ParallaxContainer> {
  double bottomPad = 40.0;
  double topPad = 0.0;
  double hozPad = 25;
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(
          left: hozPad, right: hozPad, top: topPad, bottom: bottomPad),
      duration: const Duration(milliseconds: 150),
      child: Stack(
        children: [
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Color(0x00000000),
                            Color(0x00000000),
                            Color(0xff000000),
                          ])),
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment(
                            0, -((widget.offset.abs() + 0.4) - widget.i)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.only(bottom: hozPad, left: hozPad),
                      child: Text(
                        widget.gameName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
