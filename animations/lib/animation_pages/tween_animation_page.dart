import 'package:animations/controller/game_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TweenAnimationBuilderPage extends StatelessWidget {
  const TweenAnimationBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.black,
              onPressed: () {
                Get.to(const TweenAnimationBuilder1());
              },
              child: const Text(
                "TweenAnimationBuilder1",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.black,
              onPressed: () {
                Get.to(const TweenAnimationBuilder2());
              },
              child: const Text(
                "TweenAnimationBuilder2",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.black,
              onPressed: () {
                Get.to(TweenAnimationBuilder3());
              },
              child: const Text(
                "TweenAnimationBuilder3",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TweenAnimationBuilder1 extends StatelessWidget {
  const TweenAnimationBuilder1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
          child: TweenAnimationBuilder<Color?>(
              duration: const Duration(seconds: 3),
              tween: ColorTween(begin: Colors.red, end: Colors.blue),
              builder: (context, Color? value, _) {
                return Container(
                  height: 250,
                  width: 250,
                  color: value,
                );
              })),
    );
  }
}

class TweenAnimationBuilder2 extends StatelessWidget {
  const TweenAnimationBuilder2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastOutSlowIn,
                  tween: Tween(begin: 1, end: 0),
                  child: const Text(
                    "Developer",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  builder: (context, double value, child) {
                    return Transform.translate(
                      offset: Offset(0, -200 * value),
                      child: child,
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              TweenAnimationBuilder<double>(
                  tween: Tween(begin: 1, end: 0),
                  curve: Curves.easeInCirc,
                  duration: const Duration(milliseconds: 800),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/0.jpg'),
                  ),
                  builder: (context, double value, child) {
                    return Transform.translate(
                      offset: Offset(200 * value, 0),
                      child: child,
                    );
                  }),
              TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.bounceOut,
                  tween: Tween(begin: 1, end: 0),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                  ),
                  builder: (context, double value, child) {
                    return Transform.translate(
                      offset: Offset(0, 200 * value),
                      child: child,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class TweenAnimationBuilder3 extends StatefulWidget {
  const TweenAnimationBuilder3({Key? key}) : super(key: key);

  @override
  State<TweenAnimationBuilder3> createState() => _TweenAnimationBuilder3State();
}

class _TweenAnimationBuilder3State extends State<TweenAnimationBuilder3> {
  int counter = 0;
  int? oldCounter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          onPressed: () {
            oldCounter = counter;
            setState(() {
              counter++;
            });
          },
          child: const Icon(
            Icons.next_plan,
            color: Colors.black,
          ),
        ),
        body: Center(
            child: TweenAnimationBuilder<double>(
                key: ValueKey(counter.toString()),
                duration: const Duration(milliseconds: 700),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, _) {
                  return Stack(
                    children: [
                      if (oldCounter != null)
                        Opacity(
                          opacity: 1 - value,
                          child: Transform.translate(
                            offset: Offset(80 * value, 0),
                            child: Text(
                              oldCounter.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 100,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(-70 * (1 - value), 0),
                          child: Text(
                            counter.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 100,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  );
                })));
  }
}
