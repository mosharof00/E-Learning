import 'package:elearning/app/modules/profile/profile_details/views/profile_details_ui_helper.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../global/app_primary_theme_method.dart';
import '../controllers/profile_details_controller.dart';

class ProfileDetailsView extends GetView<ProfileDetailsController> {
  const ProfileDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(170.h),
          child: const ProfileDetailsAppbar(),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileDetailsUiHelper.hiddenText(
                              'Registration number'),
                          SizedBox(height: 5.h),
                          ProfileDetailsUiHelper.visibleText('1612603190'),
                          SizedBox(height: 12.w),
                          Container(
                              height: 1,
                              width: Get.width,
                              color: Colors.grey.shade300)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 35.w),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileDetailsUiHelper.hiddenText('Class'),
                          SizedBox(
                            height: 5.h,
                          ),
                          ProfileDetailsUiHelper.visibleText('8'),
                          SizedBox(height: 12.h),
                          Container(
                              height: 1,
                              width: Get.width,
                              color: Colors.grey.shade300)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileDetailsUiHelper.hiddenText('Section'),
                          SizedBox(height: 5.h),
                          ProfileDetailsUiHelper.visibleText('A'),
                          SizedBox(height: 12.w),
                          Container(
                              height: 1,
                              width: Get.width,
                              color: Colors.grey.shade300)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 35.w),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileDetailsUiHelper.hiddenText('Roll'),
                          SizedBox(
                            height: 5.h,
                          ),
                          ProfileDetailsUiHelper.visibleText('01'),
                          SizedBox(height: 12.h),
                          Container(
                              height: 1,
                              width: Get.width,
                              color: Colors.grey.shade300)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileDetailsUiHelper.hiddenText('Group'),
                          SizedBox(height: 5.h),
                          ProfileDetailsUiHelper.visibleText('Science'),
                          SizedBox(height: 12.w),
                          Container(
                              height: 1,
                              width: Get.width,
                              color: Colors.grey.shade300)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 35.w),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileDetailsUiHelper.hiddenText('Shift'),
                          SizedBox(
                            height: 5.h,
                          ),
                          ProfileDetailsUiHelper.visibleText('1st'),
                          SizedBox(height: 12.h),
                          Container(
                              height: 1,
                              width: Get.width,
                              color: Colors.grey.shade300)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h),

            // ListView.builder

            Expanded(
              child: ListView.builder(
                  itemCount: controller.visibleTextList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileDetailsUiHelper.hiddenText(
                              controller.hiddenTextList[index]),
                          SizedBox(height: 5.h),
                          ProfileDetailsUiHelper.visibleText(
                              controller.visibleTextList[index]),
                          SizedBox(height: 12.w),
                          Container(
                              height: 1,
                              width: Get.width,
                              color: Colors.grey.shade300)
                        ],
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}

class ProfileDetailsAppbar extends StatelessWidget {
  const ProfileDetailsAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .3.sh,
      child: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50.r),
                bottomLeft: Radius.circular(50.r))),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25.r),
                bottomLeft: Radius.circular(25.r)),
            gradient: appLinearGradient(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purpleAccent),
                          child: Center(
                            child: Image.asset((Assets.images.model.path)),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextStyle(
                              text: 'RZ Tutul',
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                AppTextStyle(
                                  text: 'Class - 8 || A ',
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                                AppTextStyle(
                                  text: '|| Roll - 01',
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
              Container(
                height: 30,
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleSpacing: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // iconImage == null
              //     ? const SizedBox.shrink()
              //     : Image.asset(iconImage!, height: 25.h),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: AppTextStyle(
                    text: 'Profile Details',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.edit_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    AppTextStyle(
                      text: 'Edit',
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                    SizedBox(
                      width: 5.w,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
