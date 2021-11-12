import 'package:flutter/material.dart';

class AnimationTile extends StatelessWidget {
  const AnimationTile({
    Key? key,
    required this.title,
    required this.function,
  }) : super(key: key);
  final String title;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        tileColor: Colors.black.withOpacity(0.5),
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, letterSpacing: 2),
        ),
        onTap: function,
      ),
    );
  }
}
