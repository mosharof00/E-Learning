import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  var dropdownValue = 'Class 1'.obs;
  var classItems = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10'
  ].obs;
  var dropdownGroupvalue = 'Science'.obs;
  var groupItems = ['Science', 'Commerce', 'Arts'].obs;
  var dropdownSubvalue = 'English 1st'.obs;
  var subItems = [
    'English 1st',
    'English 2nd',
    'Bangla 1st',
    'Bangla 2nd',
    'Math',
    'Islam'
  ].obs;
  var dropdownExamValue = 'Class Test'.obs;
  var examItems = ['Class Test', 'First Revision', 'Second Revision', 'Final'];
  var dropdownChapterValue = '1-5'.obs;
  var chapterValue = ['1-5', '6-10', '11-15', '16-20'];

  var selectClass = false.obs;

  void onChangedClass(String? newValue) {
    dropdownValue.value = newValue ?? '';
    if (dropdownValue.value == 'Class 9' || dropdownValue.value == 'Class 10') {
      selectClass.value = true;
    } else {
      selectClass.value = false;
    }
  }

  void onChangedGroup(String? newGroup) {
    dropdownGroupvalue.value = newGroup ?? '';
    // You can add further logic here if needed
  }

  void onChangedSub(String? newSub) {
    dropdownSubvalue.value = newSub ?? '';
    // You can add further logic here if needed
  }

  void onChangeExam(String? newExam) {
    dropdownExamValue.value = newExam ?? '';
  }

  void onChangeChapter(String? newChapter) {
    dropdownChapterValue.value = newChapter ?? '';
  }

  var selectedDate = Rx<DateTime?>(DateTime.now());
  late TextEditingController dateTextController;

  var isClicked = false.obs;
  void handleClick() {
    isClicked.value = !isClicked.value;
  }

  @override
  void onInit() {
    super.onInit();
    dateTextController = TextEditingController();
    updateDateText();
  }

  void setDate(DateTime? date) {
    selectedDate.value = date;
    updateDateText();
    dateTextController.text = selectedDate.value != null
        ? '${selectedDate.value!.day}-${selectedDate.value!.month}-${selectedDate.value!.year}'
        : 'Select Date';
  }

  void updateDateText() {
    dateTextController.text = selectedDate.value != null
        ? '${selectedDate.value!.day}-${selectedDate.value!.month}-${selectedDate.value!.year}'
        : 'Select Date';
  }


  @override
  void onClose() {
    dateTextController.dispose(); // Dispose the TextEditingController
    super.onClose();
  }
}
