import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/global/bottomsheet/filter.dart';
import 'package:elearning/global/widget/globalButton.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/colors.gen.dart';
import '../../../../../../global/custom_appbar.dart';
import '../controllers/teacher_attendance_controller.dart';
import '../widget/studentcards.dart';
import 'attendance_teacher_count_view.dart';

class TeacherAttendanceView extends GetView<TeacherAttendanceController> {
  const TeacherAttendanceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        // iconImage: Assets.images.fees,
        title: 'Attendance',
        elevation: 0,
      ),
      body: Container(
        color: ColorName.bgColor,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
                        text: "Filter Attendance by Class,Group,Sub & Date",
                        fontSize: 10.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
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
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => AttendanceTeacherCountView(
                          item: 45,
                          icon: Assets.icons.p,
                          text: 'Total Present 45',
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF57E186),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F01E44E),
                          blurRadius: 5,
                          offset: Offset(1, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppTextStyle(
                          text: 'Total Present',
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 5.h),
                        AppTextStyle(
                          text: '45',
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                InkWell(
                  onTap: () {
                    Get.to(() => AttendanceTeacherCountView(
                          item: 5,
                          icon: Assets.icons.l,
                          text: 'Total Late 5',
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEEAC49),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3FFA3E3E),
                          blurRadius: 5,
                          offset: Offset(1, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppTextStyle(
                          text: 'Total Late',
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 5.h),
                        AppTextStyle(
                          text: '5',
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                InkWell(
                  onTap: () {
                    Get.to(() => AttendanceTeacherCountView(
                          item: 5,
                          icon: Assets.icons.a,
                          text: 'Total Absent 5',
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFF6C6C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3FFA3E3E),
                          blurRadius: 5,
                          offset: Offset(1, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppTextStyle(
                          text: 'Total Absent',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 5.h),
                        AppTextStyle(
                          text: '5',
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const StudentCards(
              items: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          GlobalButton(
              onTap: () {
                Get.toNamed(Routes.ATTENDANCETEACHER);
              },
              icon: Assets.icons.add,
              text: 'Add New')
        ],
      ),
    );
  }
}
