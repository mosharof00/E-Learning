import 'package:elearning/app/modules/result/widgets/result_cards.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/bottomsheet/filter.dart';
import 'package:elearning/global/custom_appbar.dart';
import 'package:elearning/global/widget/globalButton.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../controllers/result_controller.dart';

class TeacherResultView extends GetView<ResultController> {
  const TeacherResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      appBar: CustomAppbar(
        iconImage: Assets.images.icResult.path,
        title: 'Result',
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextStyle(
                          text: "Result",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        AppTextStyle(
                          text: "Filter Result by Class and Sub",
                          fontSize: 10.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  FilterWidget(
                    classValue: true,
                    examValue: true,
                    subjectValue: true,
                  ),
                ],
              ),
            ),
            const Expanded(child: ResultCards()),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          GlobalButton(
              onTap: () {
                Get.toNamed(Routes.TEACHER_ADD_RESULT);
              },
              icon: Assets.icons.add,
              text: "Add New")
        ],
      ),
    );
  }
}
