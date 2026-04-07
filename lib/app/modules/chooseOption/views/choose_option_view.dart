import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../global/custom_appbar.dart';
import '../../../../global/option_item_lcon_label.dart';
import '../../../../helper/config_file.dart';
import '../../../model/option_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/choose_option_controller.dart';

class ChooseOptionView extends GetView<ChooseOptionController> {
  const ChooseOptionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        iconImage: Assets.images.icResult.path,
        title: 'Elearning',
        elevation: 0,
      ),
      body: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: optionItem.length,
              itemBuilder: (context, index) {
                return OptionItemLabel(
                    onTap: () {
                      if (index == 0) {
                        (isStudent() || isParent())
                            ? Get.toNamed(Routes.ATTENDANCE)
                            : Get.toNamed(Routes.ATTENDANCETEACHER);
                      } else if (index == 1) {
                        Get.toNamed(Routes.HOME_WORK);
                      } else if (index == 2) {
                        Get.toNamed(Routes.ROUTINE);
                      } else if (index == 3) {
                        Get.toNamed(Routes.SUBJECT);
                      } else if (index == 4) {
                        Get.toNamed(Routes.EXAM);
                      } else if (index == 5) {
                        (isStudent() || isParent())
                            ? Get.toNamed(Routes.RESULT)
                            : Get.toNamed(Routes.TEACHER_RESULT);
                      } else if (index == 6) {
                        Get.toNamed(Routes.FEES);
                      } else if (index == 7) {
                        Get.toNamed(Routes.TEACHERLIST);
                      } else if (index == 8) {
                        Get.toNamed(Routes.NOTICE);
                      } else if (index == 9) {
                        Get.toNamed(Routes.REPORT);
                      } else if (index == 10) {
                        Get.toNamed(Routes.LEAVE_APPLICATION);
                      } else if (index == 11) {
                        Get.toNamed(Routes.COMPLAIN);
                      } else if (index == 12) {
                        Get.toNamed(Routes.ADMIT_CARD);
                      } else if (index == 13) {
                        Get.toNamed(Routes.ID_CARD);
                      }
                    },
                    title: optionItem[index].title!,
                    icon: optionItem[index].value!);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 110,
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
