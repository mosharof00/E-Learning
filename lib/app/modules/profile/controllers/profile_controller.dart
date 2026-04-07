import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  void increment() => count.value++;

  Future<void> goToOurWebsite() async {
    if (!await canLaunchUrl(Uri.parse("https://arcadexit.com/"))) {
      await launchUrl(Uri.parse("https://arcadexit.com/"));
    } else {
      Get.snackbar(
          'Issue!', " Could not launch this Url - https://arcadexit.com/");
    }
  }


}