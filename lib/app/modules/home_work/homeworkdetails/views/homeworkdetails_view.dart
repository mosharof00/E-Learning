import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/auto_size_app_text_style.dart';
import 'package:elearning/global/custom_appbar.dart';
import 'package:elearning/global/image_view_page.dart';
import 'package:elearning/global/widget/globalButton.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/homeworkdetails_controller.dart';

class HomeworkDetailsView extends GetView<HomeworkDetailsController> {
  const HomeworkDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> imagesList = [
      "https://askgoodquestionshome.files.wordpress.com/2019/11/q2-1.png?w=655",
      "https://img.freepik.com/free-photo/public-examination-preparation-concept_23-2149369850.jpg?w=900&t=st=1707888061~exp=1707888661~hmac=6f278396d76ae607d161ce0d5b6bbadbbb08dd9a5f02c45c4b9f9256ea96a289",
      "https://img.freepik.com/free-vector/realistic-test-paper-composition-with-pencil-stack-students-paperwork-with-marks-correct-answers_1284-54249.jpg?w=826&t=st=1707888094~exp=1707888694~hmac=c902650d862f3bc2d7d2b87bc0465f0c8895ff87d2e003160fd5b69f7bc1624a",
      "https://images.unsplash.com/photo-1518133910546-b6c2fb7d79e3?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ];
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      appBar: CustomAppbar(
        iconImage: Assets.images.icResult.path,
        title: 'Home Work Details',
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 6,
                  offset: Offset(2, 6),
                  spreadRadius: 0,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 28.h,
                          width: Get.width,
                          color: ColorName.secondary,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              AppTextStyle(
                                text: 'Class 9 Science | 01 Jan’2024',
                                color:
                                    Colors.black.withOpacity(0.699999988079071),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                height: 0,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          // color: Colors.grey.shade100,
                          color: ColorName.whiteSmoke,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  // color: Colors.blue,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 70.h,
                                        width: 70.w,
                                        child: Center(
                                          child: SvgPicture.asset(
                                              Assets.images.bookBlue),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      SizedBox(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 35.h,
                                              width: 1.w,
                                              color:
                                                  Colors.red.withOpacity(0.4),
                                            ),
                                            SizedBox(width: 5.w),
                                            SizedBox(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AppTextStyle(
                                                    text: 'Subject',
                                                    color: Colors.black
                                                        .withOpacity(
                                                            0.699999988079071),
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  SizedBox(height: 5.h),
                                                  AppTextStyle(
                                                    text: 'English',
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 35.h,
                                      width: 1.w,
                                      color: Colors.red.withOpacity(0.4),
                                    ),
                                    SizedBox(width: 5.w),
                                    SizedBox(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppTextStyle(
                                            text: 'Submission Date',
                                            color: Colors.black
                                                .withOpacity(0.699999988079071),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(height: 5.h),
                                          AppTextStyle(
                                            text: '07 Jan’2024',
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(6, 6),
                            )
                          ]),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Get.to(MyPhotoGallery(
                                  imagesList,
                                  downloadAvailable: false,
                                ));
                              },
                              child: CachedNetworkImage(
                                  imageUrl:
                                      "https://askgoodquestionshome.files.wordpress.com/2019/11/q2-1.png?w=655"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AutoSizeAppTextStyle(
                          text:
                              'Lorem Ipsum is simply dummy text of the printing and  orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s st typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry.  '
                              'Lorem Ipsum is simply dummy text of the printing and  orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s st typesetting industry. Lorem Ipsum has been the industry s Lorem Ipsum is simply dummy text of the printing and  orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s st typesetting industry. Lorem Ipsum has been the industry s ',
                          color: const Color(0xff4D4D4D).withOpacity(0.8),
                          // Colors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        AppTextStyle(
                          text: 'Day\'s Left',
                          color: Colors.black.withOpacity(0.699999988079071),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        AppTextStyle(
                          text: '7 Days',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: GlobalButton(
                        onTap: () {},
                        icon: Assets.icons.shareWhiteIcon,
                        text: 'Share',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
