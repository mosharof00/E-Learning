import 'package:elearning/app/modules/lectures/widgets/cards_basic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoLectureController extends GetxController {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late Rx<Widget> thumbnail = Rx<Widget>(Container());

  @override
  void onInit() {

    super.onInit();
    // videoPlayerController = VideoPlayerController.asset('assets/videos/sample.mp4');
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4'));
    _initializeVideo();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      looping: false,
      autoPlay: false,
      allowFullScreen: true,
    );


  }

  BasicCards cards = BasicCards();

  Future<void> _initializeVideo() async {
    try {
      await videoPlayerController.initialize();
      // final generatedThumbnail = await generateVideoThumbnail(cards.thumbnail);
      // final generatedThumbnail = await generateVideoThumbnail('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4');
      thumbnail.value = cards.thumbnail;
    } catch (e) {
      thumbnail.value = const Text("Error Loading Thumbnail", style: TextStyle(color: Colors.black));
    }
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.onClose();
  }
}
