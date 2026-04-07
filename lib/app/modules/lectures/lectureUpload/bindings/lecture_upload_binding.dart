import 'package:get/get.dart';

import '../controllers/lecture_upload_controller.dart';

class LectureUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LectureUploadController>(
      () => LectureUploadController(),
    );
  }
}
