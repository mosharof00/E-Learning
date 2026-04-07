import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class CourseDetailsController extends GetxController {
  //TODO: Implement CourseDetailsController

  final count = 0.obs;

  List<String> videoList =[
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
  ];

  final ScrollController scrollController = ScrollController();
  final isVisible = true.obs;

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  final isVideoInitialized = false.obs;

  videoInitialize(String video) async {
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(video));

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      looping: true,
      aspectRatio: 16 / 9,

    );
    await videoPlayerController!.initialize();

    isVideoInitialized.value=  videoPlayerController!.value.isInitialized;
  }

  @override
  void onInit() async{

    videoInitialize(videoList[0]);

    scrollController.addListener(() {
      isVisible.value = scrollController.position.userScrollDirection == ScrollDirection.forward;
    });

    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();

    super.onClose();
  }

  void increment() => count.value++;
}
