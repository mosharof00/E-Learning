import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/teacher_attendance_controller.dart';

class StudentCards extends StatelessWidget {
  const StudentCards({super.key, this.icon, required this.items});
  final int items;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    final attendanceTeacherController = Get.put(TeacherAttendanceController());
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items,
        itemBuilder: (context, item) {
          String nameToShow = attendanceTeacherController.studentName[item % attendanceTeacherController.studentName.length];
          String attendanceToShow = attendanceTeacherController.attendance[item % attendanceTeacherController.attendance.length];
          String imagePath;
          if (icon != null) {
            imagePath = icon!;
          } else {
            imagePath = attendanceToShow;
          }
          return Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: ColorName.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 5,
                    offset: Offset(1, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 5.w),
                        Container( height: 20.h, width: 2.w, color: ColorName.pink.withOpacity(0.5)),
                        SizedBox(width: 5.w),
                        AppTextStyle(
                          text: nameToShow,
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SvgPicture.asset(
                        imagePath,
                        height: 30.h,
                        width: 30.w,
                      ),

                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
