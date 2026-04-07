import 'package:elearning/app/modules/community/views/community_view.dart';
import 'package:elearning/app/modules/courses/views/courses_view.dart';
import 'package:elearning/app/modules/profile/views/profile_view.dart';
import 'package:elearning/app/modules/quiz/views/quiz_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';

class MainpageController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final count = 0.obs;
  final selectedTab = 0.obs;

  List pageList = [
    const HomeView(),
    const CommunityView(),
    const QuizView(),
    const CoursesView(),
    const ProfileView(),
  ];

  changeTab(int index) {
    selectedTab.value = index;
  }
}
