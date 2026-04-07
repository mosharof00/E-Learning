import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/global/app_primary_theme_method.dart';
import 'package:elearning/helper/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helper/app_text_style.dart';
import '../controllers/teacherlist_controller.dart';

class TeacherlistView extends GetView<TeacherlistController> {
  const TeacherlistView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: AppTextStyle(
            text: 'Teacher List',
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          centerTitle: false,
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: appLinearGradient(),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
          )),
        ),
        backgroundColor: ColorName.bgColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Search".tr,
                              hintStyle: const TextStyle(color: Colors.grey),
                              prefixIcon: const Icon(
                                Icons.search_sharp,
                                color: Colors.grey,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 0)),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.TEACHER_PROFILE);
                        },
                        child: Column(
                          children: [
                            ListTile(
                                leading: CircleAvatar(
                                  radius: 30.r,
                                  backgroundImage: NetworkImage(
                                      users.elementAt(index).imageUrl),
                                ),
                                title: AppTextStyle(
                                  text: users.elementAt(index).name,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                subtitle: AppTextStyle(
                                  text: 'Math, Physics, Chemistry',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.TEACHER_PROFILE);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorName.secondary,
                                  ),
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 80.w),
                              height: 0.2.h,
                              color: Colors.grey.withOpacity(0.5),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
