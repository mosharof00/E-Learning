
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';

class AppTextStyle extends StatelessWidget {
  AppTextStyle({
    required this.text,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.color,
    this.textAlign,
    this.decoration,
    this.decorationStyle,
    super.key,
  });
  String text;
  int? maxLines;
  double? fontSize;
  FontWeight? fontWeight;
  double? height;
  Color? color;
  TextAlign? textAlign;
  TextDecoration? decoration;
  TextDecorationStyle? decorationStyle;


  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: color ?? ColorName.black,
        fontSize: fontSize,
        // fontFamily: Assets.fonts.gothicA1Regular,
        fontWeight: fontWeight,
        height: height,
        decoration: decoration,
        decorationStyle: decorationStyle,
      ),
    );
  }
}


class AppTextStyleOverFlow extends StatelessWidget {
  const AppTextStyleOverFlow({
    required this.text,
    this.maxLines, this.fontSize,  this.fontWeight,this.height, this.color,
    super.key,
  });
  final String text;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style:  TextStyle(
        color: color ?? ColorName.black,
        fontSize: fontSize,
        fontFamily: Assets.fonts.gothicA1Regular,
        fontWeight: fontWeight,
        height: height,

      ),
    );
  }
}

Widget customText({required String text}) {
  return Padding(
    padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
    child: AppTextStyle(
      text: text,
      color: Colors.black.withOpacity(0.699999988079071),
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,

    ),
  );
}