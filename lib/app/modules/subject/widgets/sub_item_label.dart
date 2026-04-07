import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../helper/app_text_style.dart';

Widget subItemLabel(
    {required String title, required String icon, VoidCallback? onTap}) {
  return Center(
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
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
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                fit: BoxFit.fill,
                height: 40.h,
                width: 40.w,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: AppTextStyle(
                  text: title,
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
