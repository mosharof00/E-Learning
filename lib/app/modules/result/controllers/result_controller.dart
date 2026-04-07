import 'package:get/get.dart';

class ResultController extends GetxController {
  var dropdownvalue = 'Exam 1'.obs;
  var exams = [
    'Exam 1',
    'Exam 2',
    'Exam 3',
    'Exam 4',
    'Exam 5',
  ];
  void onChangedExams (String? newValue){
    dropdownvalue.value = newValue ?? '' ;
  }
}
