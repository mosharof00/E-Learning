import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/bottomsheet/filter.dart';
import 'package:elearning/global/custom_appbar.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:elearning/helper/config_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../global/widget/globalButton.dart';
import '../../../routes/app_pages.dart';
import '../controllers/leave_application_controller.dart';

class LeaveApplicationView extends GetView<LeaveApplicationController> {
  const LeaveApplicationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorName.bgColor,
        appBar: CustomAppbar(
          iconImage: Assets.images.icResult.path,
          title: 'Leave Application',
          elevation: 0,
        ),
        floatingActionButton: isStudent() || isParent()
            ? GlobalButton(
                onTap: () {
                  Get.toNamed(Routes.ADD_LEAVE_APPLICATION);
                },
                icon: Assets.icons.add,
                text: 'Add New')
            : const SizedBox(),
        body: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            children: [
              isStudent()
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppTextStyle(
                          text: 'Leave Application',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        FilterWidget(
                          dateValue: true,
                        )
                      ],
                    ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                  child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.LEAVE_APPLICATION_DETAILS);

                },
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Card(
                          color: ColorName.whiteSmoke,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10.r),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12.r),
                                          bottomLeft: Radius.circular(12.r))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppTextStyle(
                                            text: "Leave Reason",
                                            fontSize: 12,
                                            color: Colors.black
                                                .withOpacity(0.699999988079071),
                                          ),
                                          AppTextStyle(
                                            text: "Sick Leave",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          SizedBox(height: 2.h),
                                          AppTextStyle(
                                            text: "Leave Period",
                                            fontSize: 12,
                                            color: Colors.black
                                                .withOpacity(0.699999988079071),
                                          ),
                                          AppTextStyle(
                                            text: "01/01/2024 - 03/01/2024",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          AppTextStyle(
                                            text: "Status",
                                            fontSize: 12,
                                            color: Colors.black
                                                .withOpacity(0.699999988079071),
                                          ),
                                          AppTextStyle(
                                            text: "Pending",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 30.50.w,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      Assets.icons.forewordArrowIcon,
                                      height: 18.h,
                                      width: 30.w,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ))
            ],
          ),
        ));
  }
}
