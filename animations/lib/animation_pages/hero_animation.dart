import 'package:flutter/material.dart';

import 'package:animations/data/gamedata.dart';
import 'package:get/get.dart';

class HeroAnimationPage extends StatefulWidget {
  const HeroAnimationPage({Key? key}) : super(key: key);

  @override
  _HeroAnimationPageState createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: gamedata.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailHeroAnimationPage(
                    gameName: gamedata[index]['gameName'],
                    image: gamedata[index]['imagePath']));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Hero(
                      tag: gamedata[index]['imagePath'],
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage(gamedata[index]['imagePath']),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(gamedata[index]['gameName'])
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailHeroAnimationPage extends StatelessWidget {
  const DetailHeroAnimationPage({
    Key? key,
    required this.gameName,
    required this.image,
  }) : super(key: key);
  final String gameName;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: image,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Text(gameName)
          ],
        ),
      ),
    );
  }
}
