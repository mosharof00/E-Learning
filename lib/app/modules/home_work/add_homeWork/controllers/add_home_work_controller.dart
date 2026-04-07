import 'dart:async';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddHomeWorkController extends GetxController {
  //TODO: Implement AddHomeWorkController

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
  final selectedItem = ''.obs;
  void upDateSelectedClassItem(String value) {
    selectedClassItem.value = value;
  }

  final selectedSubjectItem = "".obs;

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

  // For time controll example

// RxBool loading = true.obs;
// void initState() {
//   Timer(const Duration(seconds: 3), () {
//     // Get.offAll(
//
//     //     // const OnbordScreens()
//     //    const HomeScreen());
//     loading.value = false;
//   });
// }

  // For post API call Example

  // final emailController = TextEditingController().obs;
  // final passwordController = TextEditingController().obs;
  // RxBool loading = false.obs;
  //
  // void postAPI() async {
  //   loading.value = true;
  //   try {
  //     final response = await post(Uri.parse('https://reqres.in/api/login'),
  //         body: {
  //           "email": emailController.value.text,
  //           "password": passwordController.value.text
  //         });
  //     var data = jsonDecode(response.body);
  //     print(response.statusCode);
  //     print(data);
  //     if (response.statusCode == 200) {
  //       loading.value = false;
  //       Get.snackbar('Login Successful', 'Congratulations');
  //     } else {
  //       loading.value = false;
  //       Get.snackbar('Login Fail', data['Error']);
  //     }
  //   } catch (e) {
  //     loading.value = false;
  //     Get.snackbar('Exception', e.toString());
  //   }
  // }
}
