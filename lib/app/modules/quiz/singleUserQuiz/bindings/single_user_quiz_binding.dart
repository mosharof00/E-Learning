import 'package:get/get.dart';

import '../controllers/single_user_quiz_controller.dart';

class SingleUserQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleUserQuizController>(
      () => SingleUserQuizController(),
    );
  }
}
