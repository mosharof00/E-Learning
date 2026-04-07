import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/groups_controller.dart';

class GroupsView extends GetView<GroupsController> {
  const GroupsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      body: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10),
          itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(Routes.GROUP_DETAILS);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://www.unicef.org.uk/rights-respecting-schools/wp-content/uploads/sites/4/2023/08/Banner-2000x900-1.jpg',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.4,
                              blurRadius: 100,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5.sw,
                        child: const AppTextStyleOverFlow(
                            text: 'Physics Group',
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                      SizedBox(
                        width: 3.sw,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: AppTextStyleOverFlow(
                              text: 'Physics Group by John Doe',
                              fontWeight: FontWeight.w300,
                              fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 200,
                          height: 1,
                          color: Colors.grey.shade100,
                        ),
                      ),
                      SizedBox(
                        width: 3.sw,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: AppTextStyleOverFlow(
                              text: 'Test Exam will be held on 20th August 2023',
                              fontWeight: FontWeight.w300,
                              fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        width: 3.sw,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: AppTextStyleOverFlow(
                              text: 'Posted on 20th August 2023',
                              fontWeight: FontWeight.w300,
                              color: Colors.grey.shade400,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
