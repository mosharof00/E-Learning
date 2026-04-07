import 'package:get/get.dart';

class HomeWorkController extends GetxController {
  //TODO: Implement HomeWorkController


  // For DropdownMenu
  final selectedClassItem = "".obs;
  void upDateSelectedClassItem(String value) {
    selectedClassItem.value = value;
  }


  final count = 0.obs;

  RxString inputDate = "".obs;

  void increment() => count.value++;
}
