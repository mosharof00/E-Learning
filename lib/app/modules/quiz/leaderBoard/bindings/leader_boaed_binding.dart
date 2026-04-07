import 'package:get/get.dart';

import '../controllers/leader_board_controller.dart';

class LeaderBoaedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaderBoardController>(
      () => LeaderBoardController(),
    );
  }
}
