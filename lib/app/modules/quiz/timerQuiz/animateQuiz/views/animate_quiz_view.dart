import 'package:elearning/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../gen/colors.gen.dart';
import '../controllers/animate_quiz_controller.dart';

class AnimateQuizView extends GetView<AnimateQuizController> {
  const AnimateQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: ColorName.bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 22.h,
            ),
            Center(
              child: GetBuilder<AnimateQuizController>(
                builder: (_) => Lottie.asset(
                  Assets.images.animation,
                  repeat: false,
                  onLoaded: (composition) {
                    controller
                        .startAnimation(composition.duration.inMilliseconds);
                  },
                ),
              ),
            ),
          ],
        ), // runs after fade.,
      ),
    );
  }
}
