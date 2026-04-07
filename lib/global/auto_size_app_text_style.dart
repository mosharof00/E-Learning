import 'package:auto_size_text/auto_size_text.dart';
import 'package:elearning/gen/assets.gen.dart';
import 'package:elearning/gen/colors.gen.dart';
import 'package:flutter/cupertino.dart';

class AutoSizeAppTextStyle extends StatelessWidget {
 const AutoSizeAppTextStyle({
    required this.text,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.color,
    super.key,
  });
 final String text;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: color ?? ColorName.black,
          fontSize: fontSize,
          fontFamily: Assets.fonts.gothicA1Regular,
          fontWeight: fontWeight,
          height: height,
        ));
  }
}
