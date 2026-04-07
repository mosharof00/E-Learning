import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../../global/widget/post_item_widget.dart';
import '../controllers/group_details_controller.dart';

class GroupDetailsView extends GetView<GroupDetailsController> {
  const GroupDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.4,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],

                ),
                child: AppTextStyle(
                  text: 'Physics Group',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: CachedNetworkImage(
                imageUrl:
                'https://www.unicef.org.uk/rights-respecting-schools/wp-content/uploads/sites/4/2023/08/Banner-2000x900-1.jpg',
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return const PostItemsWidget();
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
