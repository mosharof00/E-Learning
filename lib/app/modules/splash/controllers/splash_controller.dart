import 'package:elearning/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  Future<void> initializing() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initializing();
    super.onInit();
  }
}
