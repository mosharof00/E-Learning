import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:elearning/global/custom_appbar.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../controllers/add_complain_controller.dart';

class AddComplainView extends GetView<AddComplainController> {
  const AddComplainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppbar(title: "Add Complain"),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        margin: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
            color: ColorName.bgColor,
            borderRadius: BorderRadius.circular(3.r),
            boxShadow: const [
              BoxShadow(
                // color: Color(0x33000000),
                color: Colors.black26,
                blurRadius: 3,
              )
            ]),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(text: 'Date'),
                InkWell(
                    onTap: () async {
                      var results = await showCalendarDatePicker2Dialog(
                        context: context,
                        config: CalendarDatePicker2WithActionButtonsConfig(
                            // calendarType: CalendarDatePicker2Type.range,
                            firstDate: DateTime(2000)),
                        dialogSize: const Size(325, 400),
                        value: [
                          controller.myData.value ?? DateTime.now(),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      );
                      if (results != null && results.isNotEmpty) {
                        controller.setDate(results[0]);
                      }
                    },
                    child: Container(
                      height: 34.h,
                      width: Get.width,
                      padding: EdgeInsets.only(left: 5.w),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(2, 2),
                              spreadRadius: 0,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3.r)),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() {
                                if (controller.date.value.isEmpty) {
                                  return AppTextStyle(
                                    text:
                                        '${controller.myData.value!.day}/${controller.myData.value!.month}/${controller.myData.value!.year}',
                                    fontSize: 14.sp,
                                    // color: Colors.grey,
                                  );
                                } else {
                                  return AppTextStyle(
                                    text: controller.date.value.toString(),
                                    fontSize: 14.sp,
                                  );
                                }
                              }),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child:
                                    SvgPicture.asset(Assets.icons.calenderIcon),
                              ),
                            ],
                          )),
                    )),
                customText(text: 'Issue'),
                Container(
                    height: 34.h,
                    width: Get.width,

                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            spreadRadius: 0,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.r)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        // controller:
                        // keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5.w,bottom: 13.r),
                            border: InputBorder.none,
                            hintText: 'Enter leave reason',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: Assets.fonts.gothicA1Regular,
                              color: Colors.grey,
                            )),
                      ),
                    )),
                customText(text: "Description"),
                Container(
                  width: Get.width,
                  constraints:
                      const BoxConstraints(maxHeight: 300, minHeight: 100),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3.r)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            obscureText: false,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type Description...',
                                hintStyle: TextStyle(color: Colors.grey))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
