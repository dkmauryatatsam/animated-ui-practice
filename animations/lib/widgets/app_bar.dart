import 'package:flutter/material.dart';

PreferredSizeWidget universalAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.black.withOpacity(0.5),
    elevation: 0,
    title: Text(title),
    centerTitle: true,
  );
}
