import 'package:get/get.dart';

import '../controllers/timer_quiz_controller.dart';

class TimerQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimerQuizController>(
      () => TimerQuizController(),
    );
  }
}
