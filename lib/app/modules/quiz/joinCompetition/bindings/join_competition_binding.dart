import 'package:get/get.dart';

import '../controllers/join_competition_controller.dart';

class JoinCompetitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoinCompetitionController>(
      () => JoinCompetitionController(),
    );
  }
}
