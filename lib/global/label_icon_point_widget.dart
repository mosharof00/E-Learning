import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/app_text_style.dart';


class LabelIconPointsWidget extends StatelessWidget {
  const LabelIconPointsWidget({
    super.key,
    required this.title,
    this.icon,
    required this.value,
  });
 final String title;
  final IconData? icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color:Colors.grey.shade700,),),

        SizedBox(height: 5.h,),
        Row(
          children: [
            Container(
              height: 25,
              width: 25,
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                gradient:  LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,

                  colors: [ColorName.primary, Colors.blueAccent],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child:  Icon(
                icon?? Icons.star,
                color: Colors.white,
                size: 15,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: AppTextStyle(text: value, fontSize: 15.sp, fontWeight: FontWeight.bold,color:Colors.black,),
            )
          ],
        ),
      ],
    );
  }
}