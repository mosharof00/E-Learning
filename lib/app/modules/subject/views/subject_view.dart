import 'package:elearning/app/modules/subject/widgets/sub_item_label.dart';
import 'package:elearning/app/modules/subject/widgets/sub_model.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../global/bottomsheet/filter.dart';
import '../../../../global/custom_appbar.dart';
import '../controllers/subject_controller.dart';

class SubjectView extends GetView<SubjectController> {
  const SubjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Lecture',
        elevation: 0,
      ),
      body: Container(
        color: ColorName.bgColor,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextStyle(
                          text: "Lecture",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        AppTextStyle(
                          text: "Filter Lectures by Class",
                          maxLines: 2,
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
                  ),
                ],
              ),
            ),
            Obx(
              () => controller.selectedClass.value
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextStyle(
                            text: 'Group',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 5.h),
                          Container(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            child: Obx(
                              () => DropdownButton(
                                borderRadius: BorderRadius.circular(10.r),
                                underline: const SizedBox(),
                                isExpanded: true,
                                hint: AppTextStyle(
                                  text: 'Select Group',
                                ),
                                value: controller.dropdownGroupValue.value,
                                icon: const Icon(Icons.arrow_drop_down_sharp,
                                    size: 30),
                                items:
                                    controller.groupItems.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: controller.onChangedGroup,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true, // Important addition
                physics: const ScrollPhysics(), // Important addition
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 110,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: subItem.length,
                itemBuilder: (context, index) {
                  return subItemLabel(
                    title: subItem[index].title!,
                    icon: subItem[index].value!,
                    onTap: () {
                      if (index == 0) {
                        Get.toNamed(Routes.LECTURE);
                      } else if (index == 1) {
                        Get.toNamed(Routes.LECTURE);
                      } else if (index == 2) {
                        Get.toNamed(Routes.LECTURE);
                      } else if (index == 3) {
                        Get.toNamed(Routes.LECTURE);
                      } else if (index == 4) {
                        Get.toNamed(Routes.LECTURE);
                      } else if (index == 5) {
                        Get.toNamed(Routes.LECTURE);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
