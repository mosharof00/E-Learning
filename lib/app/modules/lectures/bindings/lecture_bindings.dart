import 'package:get/get.dart';

import '../controllers/lecture_controller.dart';

class LectureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LectureController>(
          () => LectureController(),
    );
  }
}