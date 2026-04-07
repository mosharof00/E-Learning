import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddLeaveApplicationController extends GetxController {
  //TODO: Implement AddLeaveApplicationController

  final count = 0.obs;

  TextEditingController leaveReasonController = TextEditingController();

   // for Date pick
  late final firstDate = "".obs;
  late final lastDate = "".obs;
  final dateDIF = 0.obs;
  void setFirstDate(DateTime? startDate, DateTime? endDate ) {
    firstDate.value =
        '${startDate!.day}/${startDate.month}/${startDate.year}';
    lastDate.value =
    '${endDate!.day}/${endDate.month}/${endDate.year}';
    dateDIF.value= endDate.difference(startDate).inDays + 1;
  }



}
