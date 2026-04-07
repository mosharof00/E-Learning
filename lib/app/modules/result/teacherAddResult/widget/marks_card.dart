import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../helper/app_text_style.dart';

class MarksCards extends StatelessWidget {
  const MarksCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context,item){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 5,
                  offset: Offset(1, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 25.h,
                          width: 25.h,
                          decoration: ShapeDecoration(
                            color: Colors.tealAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                          child: Center(
                              child: AppTextStyle(
                                text: item.toString(),
                              )),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      AppTextStyle(
                        text: 'RZ Tutul 1',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 5.w),
                AppTextStyle(
                  text: 'Marks',
                  fontSize: 13.sp,
                  color: ColorName.gray410,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(width: 5.w,),
                Container(
                  height: 44.h,
                  width: 100.w,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.50,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Enter mark',
                      hintStyle: TextStyle(fontSize: 11.sp,fontWeight: FontWeight.w600),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0), // Adjust padding as needed
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    },);
  }
}
