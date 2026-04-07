import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/app_text_style.dart';
import 'app_primary_theme_method.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
   const CustomAppbar({
    super.key,
    required this.title,
    this.elevation,
    this.iconImage,
  });
 final String title;
 final double? elevation;
 final String? iconImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .3.sh,
      child: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50.r),
                bottomLeft: Radius.circular(50.r))),
        elevation: elevation ?? 1,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r)),
            gradient: appLinearGradient(),),
        ),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleSpacing: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: AppTextStyle(
              text: title,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

}
