import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/bottomsheet/filter.dart';
import 'package:elearning/global/widget/globalButton.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../global/custom_appbar.dart';
import '../../widget/menuitem.dart';
import '../controllers/attendenceteacher_controller.dart';
import '../widget/attendence_cards.dart';
import '../widget/container_colored.dart';

class AttendanceteacherView extends GetView<AttendanceteacherController> {
  const AttendanceteacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Attendance',
        elevation: 0,
      ),
      body: Container(
        color: ColorName.bgColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextStyle(
                        text: "Attendance",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      AppTextStyle(
                        text: "Filter Attendance by Class,Subject and Subject",
                        fontSize: 10.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const Spacer(),
                  FilterWidget(
                    classValue: true,
                    subjectValue: true,
                    dateValue: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 40.h,
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (controller.selectedContainer.value ==
                              'All Present') {
                            // Deselect if already selected
                            controller.setSelectedContainer('');
                            controller.setSelectedOption(MenuItem
                                .individual); // Assuming MenuItem.none represents no selection
                          } else {
                            // Select the option
                            controller.setSelectedContainer('All Present');
                            controller.setSelectedOption(MenuItem.allPresent);
                          }
                        },
                        child: buildContainer(
                            'All Present',
                            const Color(0xFF58E287),
                            controller.selectedContainer.value ==
                                'All Present'),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          if (controller.selectedContainer.value ==
                              'All Late') {
                            // Deselect if already selected
                            controller.setSelectedContainer('');
                            controller.setSelectedOption(MenuItem
                                .individual); // Assuming MenuItem.none represents no selection
                          } else {
                            // Select the option
                            controller.setSelectedContainer('All Late');
                            controller.setSelectedOption(MenuItem.allLate);
                          }
                        },
                        child: buildContainer(
                            'All Late',
                            const Color(0xFFEFAD49),
                            controller.selectedContainer.value == 'All Late'),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          if (controller.selectedContainer.value ==
                              'All Absent') {
                            // Deselect if already selected
                            controller.setSelectedContainer('');
                            controller.setSelectedOption(MenuItem
                                .individual); // Assuming MenuItem.none represents no selection
                          } else {
                            // Select the option
                            controller.setSelectedContainer('All Absent');
                            controller.setSelectedOption(MenuItem.allAbsent);
                          }
                        },
                        child: buildContainer(
                            'All Absent',
                            const Color(0xFFFF6D6D),
                            controller.selectedContainer.value ==
                                'All Absent'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(
              () => AttendanceTeacherCards(
                selectedOption: controller.selectedOption.value,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          GlobalButton(
              onTap: () {
                Get.toNamed(Routes.TEACHER_ATTENDANCE);
              },
              icon: Assets.icons.saveIcon,
              text: "Save")
        ],
      ),
    );
  }
}
