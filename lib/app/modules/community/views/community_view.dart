import 'package:elearning/global/app_primary_theme_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helper/app_text_style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/community_controller.dart';

class CommunityView extends GetView<CommunityController> {
  const CommunityView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CommunityController());
    return DefaultTabController(
      length: controller.tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    gradient: appLinearGradient(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                automaticallyImplyLeading: false,
                title: AppTextStyle(
                    text: 'Community',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                centerTitle: false,
                pinned: true,
                floating: true,
                bottom: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white30,
                    indicatorColor: Colors.white,
                    controller: controller.tabController,
                    isScrollable: false,
                    tabs: controller.tabs),
                actions: [
                  IconButton(
                    onPressed: () {
                      showMenu(
                        context: context,
                        position: const RelativeRect.fromLTRB(1, 0, 0, 0),
                        items: [
                          PopupMenuItem(
                            value: 'create_friends_group',
                            child: AppTextStyle(
                              text: 'Create Friends Group',
                            ),
                          ),
                          PopupMenuItem(
                            value: 'create_chat_group',
                            child: AppTextStyle(text: 'Create Chat Group'),
                          ),
                          PopupMenuItem(
                            value: 'save_post',
                            child: AppTextStyle(text: 'Saved Posts'),
                          ),
                        ],
                        elevation: 10.0,
                      ).then(
                        (value) {
                          if (value != null) {
                            switch (value) {
                              case 'create_friends_group':
                                Get.toNamed(Routes.CHOOSE_PEOPLE);
                                break;
                              case 'create_chat_group':
                                Get.toNamed(Routes.CHOOSE_PEOPLE);
                                break;
                              case 'save_post':
                                Get.toNamed(Routes.POST_FEED);
                                break;
                            }
                          }
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.more_vert_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ];
          },
          body: TabBarView(
            controller: controller.tabController,
            children: controller.tabViews,
          ),
        ),
      ),
    );
  }
}
