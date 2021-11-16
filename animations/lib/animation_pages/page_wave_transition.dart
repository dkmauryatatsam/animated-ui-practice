import 'package:animations/data/gamedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageWaveTransition extends StatelessWidget {
  const PageWaveTransition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (context, animation, _) {
                  return const SecondPage();
                },
                opaque: false),
          );
        },
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        ),
      ),
      body: Image.asset(
        'assets/7.jpg',
        height: Get.height,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(builder: (context, constraints) {
        return TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1500),
          child: const PageContent(),
          builder: (context, double value, child) {
            return ShaderMask(
              blendMode: BlendMode.modulate,
              shaderCallback: (rect) {
                return RadialGradient(
                        radius: value * 5,
                        colors: const [
                          Colors.white,
                          Colors.white,
                          Colors.transparent,
                          Colors.transparent
                        ],
                        stops: const [
                          0.0,
                          0.5,
                          0.6,
                          1.0,
                        ],
                        center: const FractionalOffset(0.9, 0.9))
                    .createShader(rect);
              },
              child: child,
            );
          },
        );
      }),
    );
  }
}

class PageContent extends StatelessWidget {
  const PageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: gamedata.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(gamedata[index]['imagePath']),
            ),
          );
        },
      ),
    );
  }
}
