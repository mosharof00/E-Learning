import 'package:get/get.dart';

import '../controllers/teacher_add_result_controller.dart';

class TeacherAddResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherAddResultController>(
      () => TeacherAddResultController(),
    );
  }
}
