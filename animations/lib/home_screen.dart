import 'package:animations/animation_pages/animated_button.dart';
import 'package:animations/animation_pages/animated_list.dart';
import 'package:animations/animation_pages/animator_switcher.dart';
import 'package:animations/animation_pages/delayed_animation.dart';
import 'package:animations/animation_pages/fab_button.dart';
import 'package:animations/animation_pages/flip_animation.dart';
import 'package:animations/animation_pages/getx_game.dart';
import 'package:animations/animation_pages/page_wave_transition.dart';
import 'package:animations/animation_pages/parallax.dart';
import 'package:animations/animation_pages/tinder_swipe_page.dart';
import 'package:animations/animation_pages/vertical_parallax.dart';
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
          AnimationTile(
              title: "Page View And Animator Switcher",
              function: () => Get.to(const AnimatedSwitcherPage())),
          AnimationTile(
              title: "Verticle Scrolling Parallax",
              function: () => Get.to(const VerticalParallax())),
          AnimationTile(
              title: "Delayed Animation",
              function: () => Get.to(const DelayedAnimation())),
          AnimationTile(
              title: "Flip Animation",
              function: () => Get.to(const FlipAnimation())),
          AnimationTile(
              title: "Game Controller",
              function: () => Get.to(const GetxGame())),
          AnimationTile(
              title: "Page Wave Transition",
              function: () => Get.to(const PageWaveTransition())),
        ],
      ),
    );
  }
}
