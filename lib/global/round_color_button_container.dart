import 'package:elearning/global/app_primary_theme_method.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRoundColorButton extends StatelessWidget {
  const AppRoundColorButton(
      {super.key,
      this.width,
      this.height,
      this.text,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.fontFamily,
      this.onTap,
      this.borderRadius,
      this.linearGradient});
  final double? width;
  final double? height;
  final String? text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final void Function()? onTap;
  final double? borderRadius;
  final LinearGradient? linearGradient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width?.w ?? 200.w,
        height: height?.h ?? 50.h,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: ShapeDecoration(
          gradient: linearGradient ?? appLinearGradient(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 10,
              offset: Offset(1, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextStyle(
              text: text ?? "",
              textAlign: TextAlign.center,
              color: Colors.white,
              fontSize: fontSize?.sp ?? 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
