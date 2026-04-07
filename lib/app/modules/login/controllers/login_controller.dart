import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final ScrollController scrollController = ScrollController();

  final count = 0.obs;

  get passwordController => null;
  final obscureText = true.obs;

  final dynamicBorder =  const BorderRadius.only(
    topLeft: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(0),
    topRight: Radius.circular(0),
  ).obs;

  final linearGradientStudent = const LinearGradient(
    begin: Alignment(-0.68, 0.73),
    end: Alignment(0.68, -0.73),
    colors: [Color(0xFF735CF5), Color(0xFF5844E3)],
  ).obs;

  final linearGradientTeacher = const LinearGradient(
    begin: Alignment(-0.68, 0.73),
    end: Alignment(0.68, -0.73),
    colors: [Color(0xFF2DB4CC), Color(0xFF448AFF)],
  ).obs;



  final tabSelectedIndex = 0.obs;



  void increment() => count.value++;


}
