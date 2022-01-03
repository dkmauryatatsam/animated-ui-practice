import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/0.jpg'))),
        child: _buildAnimatedText('This is animated text'),
      ),
    );
  }

  Widget _buildAnimatedText(String text) => Container(
        height: 70,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Marquee(
          text: text,
          style: const TextStyle(color: Colors.white, fontSize: 40),
          blankSpace: 90,
          velocity: 150,
          pauseAfterRound: const Duration(seconds: 2),
        ),
      );
}
