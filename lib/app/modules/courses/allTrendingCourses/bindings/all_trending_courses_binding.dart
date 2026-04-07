import 'package:get/get.dart';

import '../controllers/all_trending_courses_controller.dart';

class AllTrendingCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTrendingCoursesController>(
      () => AllTrendingCoursesController(),
    );
  }
}
