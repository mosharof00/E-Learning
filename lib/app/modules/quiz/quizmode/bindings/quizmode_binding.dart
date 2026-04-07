import 'package:get/get.dart';

import '../controllers/quizmode_controller.dart';

class QuizmodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizModeController>(
      () => QuizModeController(),
    );
  }
}
