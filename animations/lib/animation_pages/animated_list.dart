import 'package:flutter/material.dart';
import 'package:animations/data/data.dart';

class AnimatedListTile extends StatefulWidget {
  const AnimatedListTile({Key? key}) : super(key: key);

  @override
  _AnimatedListTileState createState() => _AnimatedListTileState();
}

class _AnimatedListTileState extends State<AnimatedListTile> {
  final List<Widget> _paintTile = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    for (int i = 0; i < paintings.length; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      _paintTile.add(_buildTile(paintings[i]['name'], paintings[i]['image']));
      _listKey.currentState!.insertItem(_paintTile.length - 1);
    }
  }

  Widget _buildTile(String title, String imgPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ExpansionTile(
        title: Text(title),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imgPath,
            height: 50.0,
          ),
        ),
        children: const [
          Text("hello my name is this this this"),
        ],
      ),
    );
  }

  final Tween<double> _scale = Tween(begin: 0.0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedList(
          key: _listKey,
          initialItemCount: _paintTile.length,
          itemBuilder: (context, index, animation) {
            return ScaleTransition(
              scale: animation.drive(_scale),
              child: _paintTile[index],
            );
          }),
    );
  }
}
