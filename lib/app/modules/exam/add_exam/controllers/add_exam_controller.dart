
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddExamController extends GetxController {
  //TODO: Implement AddExamController

  final count = 0.obs;

// for Select Class DropDown
  final List dropDownClassList = [
    'class-1',
    'class-2',
    'class-3',
    'class-4',
    'class-5',
    'class-6',
    'class-7',
    'class-8',
    'class-9',
    'class-10'
  ];
  final selectedClassItem = "".obs;
  void upDateSelectedClassItem(String value) {
    selectedClassItem.value = value;
  }

  RxBool selectionValue = false.obs;
  classAndGroupSelection() {
    if (selectedClassItem == dropDownClassList[8]) {
      selectionValue.value = true;
    } else if (selectedClassItem == dropDownClassList[9]) {
      selectionValue.value = true;
    } else {
      selectionValue.value = false;
    }
  }
  // For Select Group DropDown

  final List dropDownGroupList = ['Science', 'Commerce', 'Agriculture'];

  final selectGroupItem = "".obs;
  void updateSelectedGroupItem(String value) {
    selectGroupItem.value = value;
  }

  // for Select Exam DropDown
  final List dropDownExamList = [
    'Exam 1',
    'Exam 2',
    'Exam 3',
    'Exam 4',
  ];

  final selectedExamItem = "".obs;
  void upDateSelectedExamItem(String value) {
    selectedExamItem.value = value;
  }

  final selectedChapterItems = "".obs;
  void updateSelectedChapterItem(String value) {
    selectedChapterItems.value = value;
  }

  // for Select Subject DropDown
  final List dropDownSubjectList = [
    'Bangla 1st part',
    'Bangla 2nd part',
    'English 1st part',
    'English 2nd part',
    'Math',
    'Physics',
    'Biology',
  ];
  final selectedSubjectItem = "".obs;
  void updateSelectedSubjectItem(String value) {
    selectedSubjectItem.value = value;
  }

  // for Date pick

  // TextEditingController leaveReasonController = TextEditingController();
  Rx<dynamic> myData = Rx<DateTime>(DateTime.now());
  late final date = "".obs;

  void setDate(DateTime? data) {
    myData.value = data;
    date.value =
        '${myData.value!.day}/${myData.value!.month}/${myData.value!.year}';
  }

  // for  AlertDialog timepicker

  RxString startHourTime = ''.obs;
  RxString startMinuteTime = ''.obs;
  RxString endHourTime = ''.obs;
  RxString endMinuteTime = ''.obs;
  RxBool hourCheck = false.obs;
  RxBool minuteCheck = false.obs;
  RxBool startTimeAmPmCheck = false.obs;
  RxBool endTimeAmPmCheck = false.obs;
  RxString startAmPmValue = 'PM'.obs;
  RxString endAmPmValue = 'PM'.obs;
  RxString timePickExceptions = ''.obs;
  RxBool fillException = false.obs;
  final startTimeHourController = TextEditingController().obs;
  final startTimeMinuteController = TextEditingController().obs;
  final endTimeHourController = TextEditingController().obs;
  final endTimeMinuteController = TextEditingController().obs;
  void updateStartAmPmValue(value) {
    startAmPmValue.value = value;
  }

  void updateEndAmPmValue(value) {
    endAmPmValue.value = value;
  }

  // fot Image Pick of file and camera


  final Rx<XFile?> imageFile = Rxn<XFile>();
  // final imagePickExceptions = ''.obs;
  Future<void> getImageFromFile() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile.value = pickedImage;
      // imagePath.value = pickedImage.path;
    } else {
      return;
    }
  }

  Future<void> getImageFromCamera() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imageFile.value = pickedImage;
      // imagePath.value = pickedImage.path;
    } else {
      return;
    }
  }

}
