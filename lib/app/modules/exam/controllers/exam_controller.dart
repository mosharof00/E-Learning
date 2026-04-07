import 'package:get/get.dart';

class ExamController extends GetxController {
  //TODO: Implement ExamController

  final count = 0.obs;

  // For Class DropDownButton
  final selectedClassItem = "".obs;
  void updateSelectedClassItem(String value) {
    selectedClassItem.value = value;
  }

  // For Exam DropDownButton
  // final selectedExamItem = " ".obs;
  // void updateSelectedExamItem(String value) {
  //   selectedExamItem.value = value;
  // }

  final selectedExam = "".obs;
  void updatedExamItem(String value) {
    selectedExam.value = value;
  }


  // final selectedSubjectItem = "".obs;
  // void upDateSelectedExamItem(String value) {
  //   selectedSubjectItem.value = value;
  // }

  void increment() => count.value++;
}
