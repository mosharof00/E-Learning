import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutineController extends GetxController with GetSingleTickerProviderStateMixin{
  final RxInt selectedTabIndex = 0.obs;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 7,
      vsync: this,
    );
  }

  void updateSelectedTab(int index) {
    selectedTabIndex.value = index;
    tabController.animateTo(index);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
