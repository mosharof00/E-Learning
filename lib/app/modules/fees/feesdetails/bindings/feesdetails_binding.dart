import 'package:get/get.dart';

import '../controllers/feesdetails_controller.dart';

class FeesdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeesdetailsController>(
      () => FeesdetailsController(),
    );
  }
}
