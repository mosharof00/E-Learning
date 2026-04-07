import 'package:get/get.dart';

import '../controllers/question_exam_controller.dart';

class QuestionExamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionExamController>(
      () => QuestionExamController(),
    );
  }
}
