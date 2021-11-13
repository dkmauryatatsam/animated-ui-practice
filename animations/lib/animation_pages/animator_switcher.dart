import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  const AnimatedSwitcherPage({Key? key}) : super(key: key);

  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 1);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  List<String> data = [
    "https://cdn.dribbble.com/users/3281732/screenshots/8159457/media/9e7bfb83b0bd704e941baa7a44282b22.jpg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/7012328/media/bcd672685071ca4da27d5f3ea44ac5db.jpg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/6727912/samji_illustrator.jpeg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/10940512/media/b2a8ea95c550e5f09d0ca07682a3c0da.jpg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/8616916/media/a7e39b15640f8883212421d134013e38.jpg?compress=1&resize=600x600",
    "https://cdn.dribbble.com/users/3281732/screenshots/6590709/samji_illustrator.jpg?compress=1&resize=600x600",
  ];

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(microseconds: 500),
            child: Container(
              key: ValueKey<String>(data[currentPage]),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(data[currentPage]), fit: BoxFit.cover),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            heightFactor: 0.55,
            child: PageView.builder(
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              controller: pageController,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Transform.scale(
                  scale: 1,
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Stack(
                      children: [
                        Container(
                          height: Get.height * 0.8,
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: const Offset(0, 5))
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: Image.network(
                              data[index],
                              fit: BoxFit.cover,
                              alignment:
                                  Alignment(-pageOffset.abs() + index, 0),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 40,
                          bottom: 40,
                          child: Text(
                            "Illustration",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
