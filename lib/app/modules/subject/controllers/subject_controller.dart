import 'package:get/get.dart';

class SubjectController extends GetxController {
  var dropdownValue = 'Class 1'.obs;
  var items = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
  ].obs;
  var dropdownGroupValue = 'Science'.obs;
  var groupItems = [
    'Science',
    'Commerce',
    'Arts',
  ].obs;
  var selectedClass = false.obs;
  void onChangedClass(String? newValue) {
    dropdownValue.value = newValue ?? '';
    if(dropdownValue.value == 'Class 9' || dropdownValue.value == 'Class 10'){
      selectedClass.value = true;
    }else{
      selectedClass.value = false;
    }
  }
  void onChangedGroup(String? newValue) {
    dropdownGroupValue.value = newValue ?? '';
  }
}
