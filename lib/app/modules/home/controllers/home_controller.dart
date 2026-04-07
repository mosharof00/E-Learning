import 'package:elearning/helper/config_file.dart';
import 'package:elearning/services/local_store_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  ScrollController scrollController = ScrollController();


  scrollToTop() {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  void increment() => count.value++;

  @override
  void onInit() {
    debugPrint(AppConfig.appFlavor.name);
    debugPrint((AppConfig.appFlavor == AppFlavor.student).toString());
    debugPrint(HiveService.getUserID());
    super.onInit();
  }
}
