import 'package:elearning/app/modules/friends/widget/friends_list.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/global/appbar_basic.dart';
import 'package:elearning/global/bottomsheet/filter.dart';
import 'package:elearning/global/round_color_button_container.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/choose_people_controller.dart';

class ChoosePeopleView extends GetView<ChoosePeopleController> {
  const ChoosePeopleView({super.key});
  // final createGroupController = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBarWithBackButton(
        title: 'Choose People',
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 10, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                AppTextStyle(
                  text: 'Filter people by Class & Group',
                  maxLines: 2,
                ),
                const Spacer(),
                FilterWidget(
                  classValue: true,
                ),
              ],
            ),
            Expanded(
              child: FriendsList(
                status: 2,
                onImageDeselected: (friend) {
                  controller.removeInvited(friend);
                },
                onImageSelected: (friend) {
                  controller.addInvited(friend);
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            AppRoundColorButton(
              onTap: () {
                Get.toNamed(Routes.CREATE_GROUP);
              },
              width: Get.width,
              text: 'Create Group',
              borderRadius: 30,
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
