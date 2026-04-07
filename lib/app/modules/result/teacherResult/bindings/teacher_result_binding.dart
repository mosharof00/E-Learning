import 'package:get/get.dart';

import '../controllers/teacher_result_controller.dart';

class TeacherResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherResultController>(
      () => TeacherResultController(),
    );
  }
}
