import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/custom_appbar.dart';
import 'package:elearning/global/image_view_page.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../global/widget/globalButton.dart';
import '../controllers/exam_details_controller.dart';

class ExamDetailsView extends GetView<ExamDetailsController> {
  const ExamDetailsView({super.key});
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
          title: 'Exam Details',
          elevation: 0,
        ),
        floatingActionButton: GlobalButton(
            onTap: () {}, icon: Assets.icons.shareWhiteIcon, text: 'Share'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 6,
                      offset: Offset(1, 6),
                      spreadRadius: 0,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: ColorName.whiteSmoke,
                          borderRadius: BorderRadius.circular(6.0.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x33000000),
                              blurRadius: 2,
                              offset: Offset(4, 4),
                              spreadRadius: 0,
                            )
                          ]),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30.h,
                                        width: 2,
                                        color: Colors.red.withOpacity(0.4),
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _miniCustomText(
                                                text: '${'Exam'.tr}:'),
                                            const SizedBox(height: 5),
                                            _customText(text: 'Class Test')
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15),
                                SizedBox(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30.h,
                                        width: 2,
                                        color: Colors.red.withOpacity(0.4),
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _miniCustomText(
                                                text: '${'Exam Date'.tr}:'),
                                            const SizedBox(height: 5),
                                            _customText(text: '06 Jan 2024')
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30.h,
                                        width: 2,
                                        color: Colors.red.withOpacity(0.4),
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _miniCustomText(
                                                text: '${'Subject'.tr}:'),
                                            const SizedBox(height: 5),
                                            _customText(text: 'English'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15),
                                SizedBox(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30.h,
                                        width: 2,
                                        color: Colors.red.withOpacity(0.4),
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _miniCustomText(
                                                text: '${'Chapter'.tr}:'),
                                            const SizedBox(height: 5),
                                            _customText(text: '1 - 5'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30.h,
                                        width: 2,
                                        color: Colors.red.withOpacity(0.4),
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _miniCustomText(
                                                text: '${'Mark'.tr}:'),
                                            const SizedBox(height: 5),
                                            _customText(text: '90')
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15),
                                SizedBox(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30.h,
                                        width: 2,
                                        color: Colors.red.withOpacity(0.4),
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _miniCustomText(
                                                text: '${'Day\'s Left'.tr}:'),
                                            const SizedBox(height: 5),
                                            _customText(text: '5')
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextStyle(
                      text:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry.  ',
                      color: const Color(0xff4D4D4D).withOpacity(0.8),
                      // Colors.grey,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

Widget _customText({required String text}) {
  return AppTextStyle(
    text: text,
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
  );
}

Widget _miniCustomText({required String text}) {
  return AppTextStyle(
    text: text,
    color: Colors.black.withOpacity(0.699999988079071),
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );
}
