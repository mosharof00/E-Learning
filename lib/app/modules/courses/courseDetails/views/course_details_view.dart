import 'package:chewie/chewie.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/app_primary_theme_method.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../global/read_more_textview.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/course_details_controller.dart';

class CourseDetailsView extends GetView<CourseDetailsController> {
  const CourseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CourseDetailsController());
    return Scaffold(
      floatingActionButton: Obx(() {
        return Visibility(
          visible: controller.isVisible.value,
          child: FloatingActionButton.extended(
            backgroundColor: ColorName.primary,
            onPressed: null,
            label: AppTextStyle(
              text: "Enroll Now",
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        );
      }),
      backgroundColor: ColorName.bgColor,
      appBar: AppBar(
        backgroundColor: ColorName.bgColor,
        elevation: 0,
        title: AppTextStyle(
            text: 'Course Details',
            color: ColorName.white,
            fontSize: 20,
            fontWeight: FontWeight.w700),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: appLinearGradient(),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorName.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Obx(() {
                  return controller.isVideoInitialized.value
                      ? SizedBox(
                          height: 270.h,
                          child: Chewie(
                            controller: controller.chewieController!,
                          ),
                        )
                      : SizedBox(
                      height: 200.h,
                      child: const Center(child: CircularProgressIndicator()));
                }),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextStyle(
                            text: 'Physics 1st paper chapter 1: Measurement',
                            color: const Color(0xFF11436A),
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.TEACHER_PROFILE);
                              },
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                        'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppTextStyle(
                                            text: 'Rz Tutul',
                                            color: const Color(0xFF11436A),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Color(0xFFF9C124),
                                                size: 20,
                                              ),
                                              AppTextStyle(
                                                  text: '4.5',
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ]),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: AppTextStyle(
                                  text: '\$150',
                                  color: ColorName.primary,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer_sharp,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                AppTextStyle(
                                    text: '1h 30m',
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.video_camera_front_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                AppTextStyle(
                                    text: '15 Lesson ',
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        AppTextStyle(
                            text: "Description",
                            color: const Color(0xFF11436A),
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                        const SizedBox(height: 10),
                        const AppReadMoreWidget(
                            text:
                                'The Flutter framework builds its layout via the composition of widgets, everything that you construct programmatically is a widget and these are compiled together to create the user interface. ',
                            maxLines: 3),
                      ]),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.videoInitialize(controller.videoList[index]);
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.play_circle_fill,
                                color: ColorName.primary,
                                size: 25,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: AppTextStyle(
                                  text: 'Lecture ${index + 1}',
                                  color: ColorName.black.withOpacity(0.6),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: AppTextStyle(
                              text: '  01:30',
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: controller.videoList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          )
        ],
      ),
    );
  }
}
