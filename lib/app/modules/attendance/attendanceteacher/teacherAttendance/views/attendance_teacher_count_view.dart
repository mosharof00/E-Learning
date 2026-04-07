import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../global/custom_appbar.dart';
import '../../../../../../helper/app_text_style.dart';
import '../widget/studentcards.dart';

class AttendanceTeacherCountView extends GetView {
  const AttendanceTeacherCountView({super.key, required this.item, required this.icon, required this.text });
  final int item;
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        // iconImage: Assets.images.fees,
        title: 'Attendance Details',
        elevation: 0,
      ),
      body: Container(
        color: ColorName.bgColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.h,),
              AppTextStyle(
                text: 'Class9 Science | 01 Jan’ 2024 | $text',
                color: Colors.black.withOpacity(0.699999988079071),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              StudentCards(icon: icon, items: item, ),
            ],
          ),
        ),
      ),
    );
  }
}

