import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../helper/app_text_style.dart';

Future customBottomSheet({
  required BuildContext context,
  required VoidCallback onTap1,
  required SvgPicture svgPicture1,
  required String text1,
  required VoidCallback onTap2,
  required SvgPicture svgPicture2,
  required String text2,
}) {
  return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(15.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: onTap1,
                child: Row(children: [
                  SizedBox(
                    height: 20.h,
                    width: 22.w,
                    child: svgPicture1,
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  AppTextStyle(
                    text: text1,
                    fontSize: 14.sp,
                  ),
                ]),
              ),
              TextButton(
                onPressed: onTap2,
                child: Row(children: [
                  SizedBox(
                    height: 20.h,
                    width: 22.w,
                    child: svgPicture2,
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  AppTextStyle(
                    text: text2,
                    fontSize: 14.sp,
                  ),
                ]),
              )
            ],
          ),
        );
      });
}
