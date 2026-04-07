import 'package:flutter/material.dart';
import '../helper/app_text_style.dart';
import 'app_primary_theme_method.dart';

class LabelWithIconHorizontal extends StatelessWidget {
  const LabelWithIconHorizontal({
    super.key,
    required this.label,
    required this.icon,
  });
 final String label;
 final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: appLinearGradient(),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: AppTextStyle(
            text: label,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}