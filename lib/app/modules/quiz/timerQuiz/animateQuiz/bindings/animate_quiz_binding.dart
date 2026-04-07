import 'package:get/get.dart';

import '../controllers/animate_quiz_controller.dart';

class AnimateQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimateQuizController>(
      () => AnimateQuizController(),
    );
  }
}
