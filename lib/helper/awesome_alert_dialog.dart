import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elearning/gen/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void awesomeAlertDialog(
  BuildContext context,
  DialogType dialogType,
  String title,
  String desc,
  VoidCallback btnCancelOnPress,
  VoidCallback btnOkOnPress,
) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: title,
    titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.gothic),
    desc: desc,
    descTextStyle: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.gothic),
    btnCancelOnPress: btnCancelOnPress,
    btnOkOnPress: btnOkOnPress,
  ).show();
}
