import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/app_text_style.dart';

class OptionItemLabel extends StatelessWidget {
  const OptionItemLabel({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
 final String title;
  final  String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                fit: BoxFit.fill,
                height: 40.h,
                width: 40.w,
                colorFilter:
                    ColorFilter.mode(ColorName.primary, BlendMode.srcIn),
              ),
              SizedBox(height: 20.h),
              AppTextStyle(
                  text: title,
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 0.09),
            ],
          ),
        ),
      ),
    );
  }
}
