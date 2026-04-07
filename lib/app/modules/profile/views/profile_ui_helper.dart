import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../helper/app_text_style.dart';

Widget customProfileHeaderOptions(
    {required String text, required String svgIcon}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 44.h,
        width: 44.w,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 7,
                offset: Offset(0.50, 1),
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: SvgPicture.asset(
            svgIcon,
            colorFilter:
                const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
            height: 25.h,
          ),
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      AppTextStyle(
        text: text,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    ],
  );
}

Widget customProfileOptions({
  required String text,
  Color? color,
  Color? containerColor,
  ColorFilter? iconColor,
  required String svgPicture,
}) {
  return Container(
    height: 40.h,
    margin: EdgeInsets.only(bottom: 8.h),
    decoration: BoxDecoration(
        color: containerColor ?? Colors.grey.shade100,
        borderRadius: BorderRadius.circular(5.r)),
    width: Get.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          height: 20.h,
          width: 20.w,
          child: Center(
            child: SvgPicture.asset(
              svgPicture,
              colorFilter: iconColor,
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        AppTextStyle(
          text: text,
          color: color ?? Colors.black,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    ),
  );
}
