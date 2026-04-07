import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDetailsUiHelper {
  static hiddenText(
    String text,
  ) {
    return AppTextStyle(
      text: text,
      color: Colors.grey,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: 0,
    );
  }

  static visibleText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTextStyle(
          text: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          height: 0,
        ),
        const Icon(
          Icons.lock_outline_rounded,
          color: Colors.black54,
        )
      ],
    );
  }
}
