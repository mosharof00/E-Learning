import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController {
  //TODO: Implement CoursesController

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
}
