import 'package:get/get.dart';

import '../controllers/my_all_courses_controller.dart';

class MyAllCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAllCoursesController>(
      () => MyAllCoursesController(),
    );
  }
}
