import 'package:elearning/gen/colors.gen.dart';
import 'package:elearning/global/app_primary_theme_method.dart';
import 'package:elearning/global/round_color_button_container.dart';
import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/join_competition_controller.dart';

class JoinCompetitionView extends GetView<JoinCompetitionController> {
  const JoinCompetitionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: AppTextStyle(
            text: "Join Competition",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          centerTitle: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: appLinearGradient(),
            ),
          ),
          actions: [
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: IconButton(
                onPressed: () {
                  controller.scanQR();
                },
                icon: const Icon(Icons.qr_code_scanner, color: Colors.black),
                iconSize: 20,
              ),
            )
          ],
        ),
        body: SizedBox(
          height: Get.height,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[

                  AppTextStyle(
                      text: "Enter Competition Code".toUpperCase(),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      6,
                      (index) => SizedBox(
                        width: 50.0,
                        child: TextFormField(
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                            counterText: "",
                          ),
                          onChanged: (String value) {
                            // Move focus to the next field if available
                            if (index < 6 - 1 && value.isNotEmpty) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),


                  const SizedBox(
                    height: 30,
                  ),

                  AppTextStyle(text: "Or", fontSize: 18, fontWeight: FontWeight.w500),

                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      onPressed: () {
                        controller.scanQR();

                      },
                      icon: const Icon(Icons.qr_code_scanner),
                      iconSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextStyle(
                    text: "Tap to Scan Code",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),


                ],
              ),

              Positioned(
                bottom: 50,
                left: 20,
                right: 20,
                child: AppRoundColorButton(
                  onTap: () {},
                  text: "Join Now",
                ),
              ),
            ],
          ),
        ));
  }
}

class OTPField extends StatelessWidget {
  final int length;
  final ValueChanged<String> onChanged;

  const OTPField({super.key, this.length = 6, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        length,
        (index) => SizedBox(
          width: 50.0,
          height: 50.0,
          child: TextField(
            maxLength: 1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (String value) {
              onChanged(value);

              // Move focus to the next field if available
              if (index < length - 1 && value.isNotEmpty) {
                FocusScope.of(Get.context!).nextFocus();
              }
            },
          ),
        ),
      ),
    );
  }
}
