import 'package:get/get.dart';

import '../controllers/all_category_courses_controller.dart';

class AllCategoryCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllCategoryCoursesController>(
      () => AllCategoryCoursesController(),
    );
  }
}
