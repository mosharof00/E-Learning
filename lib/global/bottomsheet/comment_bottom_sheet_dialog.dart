import 'package:elearning/helper/constant_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../gen/colors.gen.dart';
import '../../helper/app_text_style.dart';
import '../read_more_textview.dart';
import '../widget/potogallery_widget.dart';

void commentDialog(String commentCount, String title, BuildContext context) {
  final formKey = GlobalKey<FormState>();
  List<String> listOfUrls = [
    "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
    "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
    "https://s23574.pcdn.co/wp-content/uploads/Singular-1140x703.jpg",
    "https://www.expatica.com/app/uploads/sites/9/2017/06/Lake-Oeschinen-1200x675.jpg",
  ];
  showModalBottomSheet<void>(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    context: context,
    backgroundColor: ColorName.bgColor,
    builder: (BuildContext context) {
      final TextEditingController controller = TextEditingController(text: "");
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AnimatedPadding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Material(
                      elevation: 0.4,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppTextStyle(
                                  text: "Tutul's Post Comments",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(Icons.close))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 0.5.sh,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const CircleAvatar(
                                            radius: 20,
                                            backgroundImage: NetworkImage(
                                                'https://www.w3schools.com/howto/img_avatar.png'),
                                          ),
                                          const SizedBox(width: 10),
                                          AppTextStyle(
                                              text: 'Abudullah Mamun',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ],
                                      ),
                                      AppTextStyle(
                                          text: '2 hours ago',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 50),
                                    child: AppReadMoreWidget(
                                      text:
                                          'The Flutter framework builds its layout via the composition of widgets, everything that you construct programmatically is a widget and these are compiled together to create the user interface. ',
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  PhotoGalleryWidget(
                                    listOfUrls: listOfUrls,
                                  ),
                                ],
                              ),
                            );
                          })),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                    child: TextFormField(
                      controller: controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          // HelperUtils.showToast("Write something...");
                          return "Write something...";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        if (value != null) {
                          //widget.videoController.commentText.value = value;
                        }
                      },
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: AppConstants.fontFamily,
                          color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 10, right: 10),
                          suffixIcon: Container(
                            decoration: BoxDecoration(
                              color: ColorName.primary,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Type a comment',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: AppConstants.fontFamily,
                              color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 0.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 0.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}
