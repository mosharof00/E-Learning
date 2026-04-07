import 'package:get/get.dart';

import '../controllers/notice_details_controller.dart';

class NoticeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticeDetailsController>(
      () => NoticeDetailsController(),
    );
  }
}
