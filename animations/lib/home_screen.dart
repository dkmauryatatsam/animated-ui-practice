import 'package:animations/animation_pages/animated_button.dart';
import 'package:animations/animation_pages/animated_list.dart';
import 'package:animations/animation_pages/animation1.dart';
import 'package:animations/animation_pages/fab_button.dart';
import 'package:animations/animation_pages/parallax.dart';
import 'package:animations/animation_pages/tinder_swipe_page.dart';
import 'package:animations/widgets/expanded_fab.dart';
import 'package:animations/widgets/animation_tile.dart';
import 'package:animations/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: universalAppBar("Animations"),
      body: ListView(
        children: [
          AnimationTile(
            title: "Animated Expanded FAB",
            function: () => Get.to(const AnimatedFAB()),
          ),
          AnimationTile(
            title: "Tinder Swipe",
            function: () {
              Get.to(const TinderSwipe());
            },
          ),
          AnimationTile(
              title: "Parallax", function: () => Get.to(const Parallax())),
          AnimationTile(
              title: "Animated List",
              function: () => Get.to(const AnimatedListTile())),
          AnimationTile(
              title: "Animated Button",
              function: () => Get.to(const AnimatedButton())),
        ],
      ),
    );
  }
}
