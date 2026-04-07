import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../gen/colors.gen.dart';
import '../helper/constant_file.dart';

class AppReadMoreWidget extends StatelessWidget {
  const AppReadMoreWidget({
    super.key,
    required this.text,
    required this.maxLines,
  });
  final  String text;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: maxLines,
      style: TextStyle(
          color: Colors.grey.shade700,
          fontFamily: AppConstants.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      colorClickableText: ColorName.primary,
      trimMode: TrimMode.Line,
      trimCollapsedText: '...Read more'.tr,
      trimExpandedText: 'Less'.tr,
    );
  }
}