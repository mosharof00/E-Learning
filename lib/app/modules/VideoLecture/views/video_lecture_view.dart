import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../global/custom_appbar.dart';
import '../../../../helper/app_text_style.dart';
import '../../lectures/widgets/cards_basic.dart';
import '../controllers/video_lecture_controller.dart';

class VideoLecture extends StatelessWidget {
  final VideoLectureController controller = Get.put(VideoLectureController());

  VideoLecture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        // iconImage: Assets.images.appbar.path,
        title: 'Video Player',
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.black,
            child: Center(
              child: Obx(
                () => controller.videoPlayerController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio:
                            controller.videoPlayerController.value.aspectRatio,
                        child: Chewie(
                          controller: controller.chewieController,
                        ),
                      )
                    : AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Center(
                          child: controller.thumbnail.value,
                        ),
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextStyle(
                  text: 'Video Title Video Title Video Title Video Title',
                  color: const Color(0xFF11436A),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                AppTextStyle(
                  text: 'Video SubTitle',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          Expanded(
            child: BasicCards(),
          ),
        ],
      ),
    );
  }
}
