import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AttendanceController extends GetxController {
  final RxList<DateTime?> dates = <DateTime?>[].obs;

  List<DateTime?> date = [
    DateTime.now(),
  ];
  final weekendTextStyle =
      TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w700);
  final dayTextStyle =
      const TextStyle(color: Colors.black, fontWeight: FontWeight.w400);
  List<String> weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  TextStyle? getWeekdayLabelTextStyle(int index) {
    // Customize weekday labels
    if (index == 5 || index == 6) {
      // Friday or Saturday
      return const TextStyle(color: Colors.red, fontWeight: FontWeight.bold);
    } else {
      return const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
    }
  }

  List<DateTime?> selectedDates = [
    DateTime.now()
        .subtract(Duration(days: DateTime.now().weekday - DateTime.friday)),
    DateTime.now()
        .subtract(Duration(days: DateTime.now().weekday - DateTime.saturday)),
  ];

  void onDateChanged(List<DateTime?> selectedDates) {
    dates.assignAll(selectedDates);
  }

  // void increment() => count.value++;
}
