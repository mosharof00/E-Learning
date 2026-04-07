import 'package:get/get.dart';

import '../controllers/choose_categories_controller.dart';

class ChooseCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseCategoriesController>(
      () => ChooseCategoriesController(),
    );
  }
}
