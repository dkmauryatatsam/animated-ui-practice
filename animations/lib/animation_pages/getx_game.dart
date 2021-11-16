import 'package:animations/controller/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxGame extends StatelessWidget {
  const GetxGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<GameController>(
        init: GameController(),
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.playerA();
                  },
                  child: Container(
                    height: 100 + controller.scoreA * 5,
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.playerB();
                  },
                  child: Container(
                    height: 100 + controller.scoreB * 5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
