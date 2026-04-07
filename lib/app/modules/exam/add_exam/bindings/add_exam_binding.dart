import 'package:get/get.dart';

import '../controllers/add_exam_controller.dart';

class AddExamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddExamController>(
      () => AddExamController(),
    );
  }
}
