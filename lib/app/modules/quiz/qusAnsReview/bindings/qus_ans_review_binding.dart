import 'package:get/get.dart';

import '../controllers/qus_ans_review_controller.dart';

class QusAnsReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QusAnsReviewController>(
      () => QusAnsReviewController(),
    );
  }
}
