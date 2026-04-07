import 'package:get/get.dart';

import '../controllers/teacherlist_controller.dart';

class TeacherlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherlistController>(
      () => TeacherlistController(),
    );
  }
}
