import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class LectureUploadController extends GetxController {
  final List dropDownClassList = [
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
  ];
  final List dropDownSubjectList = [
    'Bangla 1st part',
    'Bangla 2nd part',
    'English 1st part',
    'English 2nd part',
    'Math',
    'Physics',
    'Biology',
  ];
  final List dropDownLectureType = [
    'Chapter(Video)',
    'Suggestion(Documentation)',
  ];

  // List<DateTime?> dates = [
  //   DateTime.now(),
  // ];

  var selectedClass = false.obs;

  final selectedLectureType = ''.obs;
  final selectedType = ''.obs;

  void updateSelectedLectureType(String value) {
    selectedLectureType.value = value;
    selectedType.value = value;
  }

  final List dropdownGroupList = ['Science', 'Commerce', 'Arts'].obs;
  final selectedGrpType = ''.obs;

  void updateSelectedGroupType(String value) {
    selectedGrpType.value = value;
  }

  final selectedClassItem = "".obs;

  void upDateSelectedClassItem(String value) {
    selectedClassItem.value = value;
    if (selectedClassItem.value == 'Class 9' ||
        selectedClassItem.value == 'Class 10') {
      selectedClass.value = true;
    } else {
      selectedClass.value = false;
    }
  }

  final selectedSubjectItem = "".obs;

  void updateSelectedSubjectItem(String value) {
    selectedSubjectItem.value = value;
  }

  final RxString pickedFileName = RxString('');
  Future<void> pickVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      final videoPath = pickedFile.path;
      final fileName = pickedFile.name;
      pickedFileName.value = fileName;
      update();
      if (videoPath.isNotEmpty) {
        try {
          await launchUrl(Uri.parse(videoPath));
        } on PlatformException catch (e) {
          // Handle the PlatformException here
          if (kDebugMode) {
            print('Error launching video URL: $e');
          }
        }
      }
    } else {
      if (kDebugMode) {
        print('pickedFile Null');
      }
    }
  }

  Future<void> pickDoc() async {
    final pickedFile =
        await FilePicker.platform.pickFiles(); // Limit to single file

    if (pickedFile != null) {
      final docPath = pickedFile.files.single.path;
      final fileName = pickedFile.files.single.name;
      pickedFileName.value = fileName; //Get the filename
      if (docPath != null && docPath.isNotEmpty) {
        if (docPath.isNotEmpty) {
          try {
            await launchUrl(Uri.parse(docPath));
          } on PlatformException catch (e) {
            // Handle the PlatformException here
            if (kDebugMode) {
              print('Error launching video URL: $e');
            }
          }
        }
      } else {
        if (kDebugMode) {
          print('pickedFile Null');
        }
      }
    }
  }
}
