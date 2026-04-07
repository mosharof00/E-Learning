import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';

class AnimateQuizController extends GetxController {
  void startAnimation(int duration) {
    _controllerTopCenter.play();
    _controllerTopLeft.play();

    Future.delayed(Duration(milliseconds: duration), () {
      Get.offNamed(Routes.TIMER_QUIZ);
    });
  }

  RxInt countdown = 3.obs;

  // Method to start the countdown animation
  Future<void> startCountdown() async {
    while (countdown.value > 0) {
      await Future.delayed(const Duration(seconds: 1));
      countdown.value--;
    }

  }

  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerTopLeft;

  @override
  void onInit() {
    super.onInit();

    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopLeft =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  ConfettiController get controllerTopCenter => _controllerTopCenter;
  ConfettiController get controllerTopLeft => _controllerTopLeft;

  @override
  void onClose() {
    _controllerTopCenter.dispose();
    _controllerTopLeft.dispose();
    super.onClose();
  }

  void playTopCenter() {
    _controllerTopCenter.play();
  }

  void playTopLeft() {
    _controllerTopLeft.play();
  }
}
