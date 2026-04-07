import 'package:get/get.dart';

class AddComplainController extends GetxController {
  //TODO: Implement AddComplainController

  final count = 0.obs;

  // for Date pick
  Rx<dynamic> myData = Rx<DateTime>(DateTime.now());
  late final date = "".obs;

  void setDate(DateTime? data) {
    myData.value = data;
    date.value =
        '${myData.value!.day}/${myData.value!.month}/${myData.value!.year}';
  }
}
