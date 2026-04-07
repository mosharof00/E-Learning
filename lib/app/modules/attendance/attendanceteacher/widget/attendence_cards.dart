import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../helper/app_text_style.dart';
import '../../widget/menuitem.dart';
import '../controllers/attendenceteacher_controller.dart';

class AttendanceTeacherCards extends StatelessWidget {
  const AttendanceTeacherCards({super.key, required this.selectedOption});
  final MenuItem? selectedOption;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceteacherController>(
      init: AttendanceteacherController(),
      builder: (controller) => Expanded(
        child: Container(
          color: ColorName.bgColor,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  surfaceTintColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            height: 25.h,
                            width: 25.h,
                            decoration: ShapeDecoration(
                              color: Colors.tealAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                            ),
                            child: Center(
                                child: AppTextStyle(
                              text: index.toString(),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextStyle(
                              text: "Rasheduz Zaman Tutul",
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(width: 3.w),
                            Row(
                              children: [
                                AppTextStyle(
                                  text: "Class: 10",
                                  color: Colors.grey,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(width: 5.w),
                                AppTextStyle(
                                  text: "Group: Science",
                                  color: Colors.grey,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 10.w),
                        _buildColoredContainer('P', const Color(0xFF58E287), 'P',
                            controller, index, selectedOption),
                        SizedBox(width: 5.w),
                        _buildColoredContainer('L', const Color(0xFFEFAD49), 'L',
                            controller, index, selectedOption),
                        SizedBox(width: 5.h),
                        _buildColoredContainer('A', const Color(0xFFFF6D6D), 'A',
                            controller, index, selectedOption),
                        SizedBox(width: 5.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildColoredContainer(
      String text,
      Color backgroundColor,
      String containerType,
      AttendanceteacherController controller,
      int index,
      MenuItem? selectedOption) {
    bool isSelected = selectedOption == MenuItem.individual
        ? controller.isColored(index, containerType)
        : (selectedOption == MenuItem.allPresent && containerType == 'P') ||
            (selectedOption == MenuItem.allLate && containerType == 'L') ||
            (selectedOption == MenuItem.allAbsent && containerType == 'A');

    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          if (selectedOption == MenuItem.individual) {
            controller.toggleColor(index, containerType); // Toggle color on tap
          }
        },
        child: Container(
          width: 38.w,
          height: 35.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? backgroundColor : Colors.grey.shade200,
            border: Border.all(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          child: Center(
            child: AppTextStyle(
              text: text,
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
