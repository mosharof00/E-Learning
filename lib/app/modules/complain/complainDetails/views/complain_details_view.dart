import 'package:elearning/global/custom_appbar.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../gen/colors.gen.dart';
import '../controllers/complain_details_controller.dart';


class ComplainDetailsView extends GetView<ComplainDetailsController> {
  const ComplainDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Complain Details"),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.only(top: 15.r, left: 15.r, right: 15.r),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(text: 'Submission Date'),
              Container(
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
                    child: AppTextStyle(
                      text: "01/01/2024",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              customText(text: 'Issue'),
              Container(
                width: Get.width,
                constraints: BoxConstraints(minHeight: 34.h),
                padding: EdgeInsets.all(5.r),
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
                child: AppTextStyle(
                  text:
                      "We need to improve our class environment We need to improve our class environment",
                  fontSize: 14.sp,
                ),
              ),
              customText(text: "Description"),
              Container(
                  width: Get.width,
                  // constraints: const BoxConstraints(maxHeight: 300, minHeight: 100),
                  padding: EdgeInsets.all(8.r),
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
                  child: AppTextStyle(
                    text:
                        'Lorem Ipsum is simply dummy text of the printing and  orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s st typesetting industry. Lorem Ipsum has been the industry  simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry.  '
                        'Lorem Ipsum is s industry. Lore simply dummy industry s st typesetting industry. Lorem Ipsum has been the industry s ',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
