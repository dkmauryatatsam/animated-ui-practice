import 'package:get/state_manager.dart';

class GameController extends GetxController {
  RxDouble scoreA = RxDouble(0.0);
  RxDouble scoreB = RxDouble(0.0);

  void playerA() {
    scoreA.value++;
  }

  void playerB() {
    scoreB.value++;
  }

  void reset() {
    scoreA.value = 0.0;
    scoreB.value = 0.0;
  }
}
