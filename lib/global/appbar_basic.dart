import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../gen/colors.gen.dart';



class SimpleAppBarWithBackButton extends StatelessWidget implements PreferredSizeWidget{
   const SimpleAppBarWithBackButton({super.key,required this.title});
 final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorName.primary,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: AppTextStyle(text: title,color: Colors.white,),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

}



