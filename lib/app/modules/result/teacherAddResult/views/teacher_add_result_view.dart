import 'package:elearning/app/modules/result/teacherAddResult/widget/marks_card.dart';
import 'package:elearning/global/bottomsheet/filter.dart';
import 'package:elearning/global/widget/globalButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../global/custom_appbar.dart';
import '../../../../../helper/app_text_style.dart';
import '../controllers/teacher_add_result_controller.dart';

class TeacherAddResultView extends GetView<TeacherAddResultController> {
  const TeacherAddResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        iconImage: Assets.images.icResult.path,
        title: 'Add Result',
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                  FilterWidget(classValue: true, subjectValue: true, examValue: true,),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            const Expanded(child: MarksCards()),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          GlobalButton(onTap: (){}, icon: Assets.icons.uploadIcon, text: 'Upload Now')
        ],
      ),
    );
  }
}
