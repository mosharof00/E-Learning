import 'package:draggable_home/draggable_home.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helper/config_file.dart';
import '../controllers/home_controller.dart';
import '../widget/header_widget.dart';
import '../widget/home_body_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return DraggableHome(
      scrollController: controller.scrollController,
      leading: IconButton(
        onPressed: () {
          controller.scrollToTop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),

      title: Align(
        alignment: Alignment.centerLeft,
        child: AppTextStyle(
            text: "E-Learning",
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1.5),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
      headerWidget: headerWidget(context),
      // headerBottomBar: headerBottomBarWidget(),
      body: [
        homepageBody(),
      ],
      headerExpandedHeight: getExpandedHeight(context),
      //fullyStretchable: true,
      backgroundColor: Colors.white,
      appBarColor: ColorName.primary,
    );
  }
}
