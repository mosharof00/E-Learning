import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../helper/app_text_style.dart';

Widget buildContainer(String text, Color color, bool isSelected) {
  return Container(
    height: 40.h,
    padding: const EdgeInsets.all(10),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: isSelected ? color : color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      shadows: [
        BoxShadow(
          color: isSelected ? color.withOpacity(0.75) : Colors.transparent,
          blurRadius: 5.r,
          offset: const Offset(1, 2),
          spreadRadius: 0,
        )
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20.h,
          width: 20.w,
          decoration: BoxDecoration(
            color: isSelected ? color : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 2.w,
            ),
          ),
        ),
        SizedBox(width: 5.w),
        AppTextStyle(
          text: text,
          color: Colors.white,
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
        ),
      ],
    ),
  );
}