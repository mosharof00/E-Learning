import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../gen/colors.gen.dart';
import '../../helper/app_text_style.dart';
import '../app_primary_theme_method.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key,required this.onTap,required this.icon,required this.text,});

  final VoidCallback onTap;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 9.50),
        decoration: ShapeDecoration(
          gradient: appLinearGradient(),
          shape: RoundedRectangleBorder(
            side:  const BorderSide(width: 2, color: ColorName.start),
            borderRadius: BorderRadius.circular(20),
          ),
          shadows:  [
            BoxShadow(
              color: ColorName.secondPrimary,
              blurRadius: 10,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 15.h,
              width: 15.w,
              colorFilter:
              const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            SizedBox(width: 5.w),
            AppTextStyle(
              text: text,
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
