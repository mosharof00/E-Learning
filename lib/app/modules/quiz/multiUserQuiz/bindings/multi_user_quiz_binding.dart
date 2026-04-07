import 'package:get/get.dart';

import '../controllers/multi_user_quiz_controller.dart';

class MultiUserQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MultiUserQuizController>(
      () => MultiUserQuizController(),
    );
  }
}
