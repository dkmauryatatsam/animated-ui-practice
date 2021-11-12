import 'package:animations/widgets/tinder_card.dart';
import 'package:flutter/material.dart';

class TinderSwipe extends StatelessWidget {
  const TinderSwipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: const TinderCard(
          imgUrl:
              "https://images.unsplash.com/photo-1636135790458-269921461b3d?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60"),
    )));
  }
}
