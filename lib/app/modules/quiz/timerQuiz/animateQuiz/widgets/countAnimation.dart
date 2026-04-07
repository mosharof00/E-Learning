import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../gen/colors.gen.dart';
import '../../../../../../helper/app_text_style.dart';

class CountdownAnimation extends StatelessWidget {
  final int countdown;

  const CountdownAnimation({super.key, required this.countdown});

  @override
  Widget build(BuildContext context) {
    return AppTextStyle(
      text: countdown.toString(),
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: ColorName.primary,
    ).animate().fade(duration: 500.ms).scale();
  }
}
