import 'package:elearning/app/modules/result/widgets/studentResultCards.dart';
import 'package:elearning/global/bottomsheet/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../global/custom_appbar.dart';
import '../../../../../helper/app_text_style.dart';
import '../controllers/result_details_controller.dart';

class ResultDetailsView extends GetView<ResultDetailsController> {
  const ResultDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        iconImage: Assets.images.icResult.path,
        title: 'Result Details',
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextStyle(
                          text: "Result Details",
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
                ),
                const Spacer(),
                FilterWidget(classValue: true, subjectValue: true, examValue: true,),
              ],
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 5,
                      offset: Offset(1, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        clipBehavior: Clip.antiAlias,
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextStyle(
                              text: 'RZ Tutul 1',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(height: 2.h),
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 1.h,
                              color: ColorName.pink.withOpacity(0.3),
                            ),
                            SizedBox(height: 7.h),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppTextStyle(
                                        text: 'Total Marks',
                                        color: Colors.black
                                            .withOpacity(0.699999988079071),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      SizedBox(height: 6.h),
                                      AppTextStyle(
                                        text: '450/500',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),
                                // SizedBox(width: 20.w),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppTextStyle(
                                        text: 'Grade',
                                        color: Colors.black
                                            .withOpacity(0.699999988079071),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      SizedBox(height: 6.h),
                                      AppTextStyle(
                                        text: 'A',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextStyle(
                                      text: 'Result',
                                      color: Colors.black
                                          .withOpacity(0.699999988079071),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(height: 6.h),
                                    AppTextStyle(
                                      text: 'Pass',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 100.h,
                      padding: const EdgeInsets.all(10),
                      clipBehavior: Clip.antiAlias,
                      decoration: const ShapeDecoration(
                        color: ColorName.whiteSmoke,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                      ),
                      child: SvgPicture.asset(
                        Assets.icons.forewordArrowIcon,
                        // height: 50.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            const Expanded(child: StudentResultCards()),
          ],
        ),
      ),
    );
  }
}
