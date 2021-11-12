import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:get/state_manager.dart';

class TinderController extends GetxController {
  final RxBool _isDragging = RxBool(false);
  final Rx<Offset> _position = Rx(Offset.zero);
  final Rx<Size> _screenSize = Rx(Size.zero);
  final Rx<double> _angle = Rx(0);

  RxBool get isDragging => _isDragging;
  Rx<double> get angle => _angle;
  void setScreenSize(Size screenSize) => _screenSize.value = screenSize;
  Rx<Offset> get position => _position;
  void startPosition(DragStartDetails details) {
    _isDragging.value = true;
  }

  void updatePosition(DragUpdateDetails details) {
    _position.value = _position.value + details.delta;
    final x = _position.value.dx;
    _angle.value = 45 * x / _screenSize.value.width;
  }

  void endPosition() {
    resetPosition();
  }

  void resetPosition() {
    _isDragging.value = false;
    _angle.value = 0;
    _position.value = Offset.zero;
  }
}
