import 'package:elearning/helper/app_text_style.dart';
import 'package:flutter/material.dart';

Widget dashboardCard({
  required String imagePath,
  required String title,
  GestureTapCallback? onTap,
}) {
  return Expanded(
    flex: 1,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Image.asset(
                  imagePath,
                  height: 70,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: AppTextStyle(text: title, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
