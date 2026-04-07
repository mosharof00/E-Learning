import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../gen/assets.gen.dart';

class NetworkErrorItem extends StatelessWidget {
  const NetworkErrorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.noInternetImage.path,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 30),
            AppTextStyle(
                text: 'Internet connection lost!',
                fontSize: 15,
                color: ColorName.primary),
            AppTextStyle(
                text: 'Check your connection and try again.',
                fontSize: 15,
                color: ColorName.primary),
          ],
        ),
      ),
    );
  }
}
