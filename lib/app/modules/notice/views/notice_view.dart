import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../global/custom_appbar.dart';
import '../../../../helper/app_text_style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/notice_controller.dart';

class NoticeView extends GetView<NoticeController> {
  const NoticeView({super.key});
  @override
  Widget build(BuildContext context) {
    List elements = [
      {'name': 'John', 'group': 'Today'},
      {'name': 'Will', 'group': 'Yesterday'},
      {'name': 'Beth', 'group': 'Today'},
      {'name': 'Miranda', 'group': 'Yesterday'},
      {'name': 'Mike', 'group': 'Last Week'},
      {'name': 'Danny', 'group': 'Last Week'},
      {'name': 'John', 'group': 'Today'},
      {'name': 'Will', 'group': 'Yesterday'},
      {'name': 'Beth', 'group': 'Today'},
      {'name': 'Miranda', 'group': 'Yesterday'},
      {'name': 'Mike', 'group': 'Last Week'},
      {'name': 'Danny', 'group': 'Last Week'},
      {'name': 'John', 'group': 'Today'},
      {'name': 'Will', 'group': 'Yesterday'},
      {'name': 'Beth', 'group': 'Today'},
      {'name': 'Miranda', 'group': 'Yesterday'},
      {'name': 'Mike', 'group': 'Last Week'},
      {'name': 'Danny', 'group': 'Last Week'},
      {'name': 'John', 'group': 'Today'},
      {'name': 'Will', 'group': 'Yesterday'},
      {'name': 'Beth', 'group': 'Today'},
      {'name': 'Miranda', 'group': 'Yesterday'},
      {'name': 'Mike', 'group': 'Last Week'},
      {'name': 'Danny', 'group': 'Last Week'},
      {'name': 'John', 'group': 'Today'},
      {'name': 'Will', 'group': 'Yesterday'},
      {'name': 'Beth', 'group': 'Today'},
      {'name': 'Miranda', 'group': 'Yesterday'},
      {'name': 'Mike', 'group': 'Last Week'},
      {'name': 'Danny', 'group': 'Last Week'},
    ];
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      appBar: CustomAppbar(
        title: 'Notice',
      ),
      body: GroupedListView<dynamic, String>(
        elements: elements,
        groupBy: (element) => element['group'],
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1['name'].compareTo(item2['name']),
        order: GroupedListOrder.ASC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTextStyle(
                text: value,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: ColorName.primary),
          ),
        ),
        itemBuilder: (c, element) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: const Text(
                  "Exam will be held on 12th March Exam will be held on 12th March"),
              subtitle: AppTextStyle(
                  text: '3 min ago', fontSize: 12, color: ColorName.primary),
              onTap: () => Get.toNamed(Routes.NOTICE_DETAILS),
              leading: CircleAvatar(
                child: Text(element['name'].toString().substring(0, 1)),
              ),
              trailing: CachedNetworkImage(
                imageUrl:
                    'https://cdn.pixabay.com/photo/2015/12/15/06/42/kids-1093758_1280.jpg',
                imageBuilder: (context, imageProvider) => Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          );
        },
      ),
    );
  }
}
