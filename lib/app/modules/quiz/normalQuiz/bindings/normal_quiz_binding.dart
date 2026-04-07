import 'package:get/get.dart';

import '../controllers/normal_quiz_controller.dart';

class NormalQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NormalQuizController>(
      () => NormalQuizController(),
    );
  }
}
