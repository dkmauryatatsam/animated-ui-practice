import 'package:animations/widgets/app_bar.dart';
import 'package:animations/widgets/expanded_fab.dart';
import 'package:flutter/material.dart';

class AnimatedFAB extends StatefulWidget {
  const AnimatedFAB({Key? key}) : super(key: key);

  @override
  State<AnimatedFAB> createState() => _AnimatedFABState();
}

class _AnimatedFABState extends State<AnimatedFAB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: universalAppBar("Animated FAB"),
      body: const SafeArea(child: AnimatedExpandedFAB()),
    );
  }
}
