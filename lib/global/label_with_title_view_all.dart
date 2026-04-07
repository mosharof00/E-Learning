import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';
import '../helper/app_text_style.dart';

class TitleWithViewAllWidget extends StatelessWidget {
  const TitleWithViewAllWidget({
    super.key,
    required this.title,
    this.viewAll,
    this.onTap,
    this.topPadding,
  });
  final String title;
  final String? viewAll;
  final VoidCallback? onTap;
  final double? topPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top:topPadding?? 15.h, bottom: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextStyle(
            text: title,
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          TextButton(
              onPressed: onTap,
              child: AppTextStyle(
                text: viewAll ?? "View All",
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: ColorName.primary,
              )),
        ],
      ),
    );
  }
}
