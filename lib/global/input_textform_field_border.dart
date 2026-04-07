import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppInputTextFormField extends StatelessWidget {
  const AppInputTextFormField({super.key, this.controller, this.hintText, this.labelText, this.validator, this.obscureText, this.keyboardType, this.suffixIcon, this.prefixIcon, this.enabled, this.readOnly, this.maxLength, this.maxLines,  this.onChanged, this.onTap, this.onSaved, this.onEditingComplete, this.onFieldSubmitted, this.textInputAction, this.focusNode, this.autofocus, this.contentPadding, this.margin, this.fillColor, this.cursorColor, this.enabledBorderColor, this.focusedBorderColor, this.disabledBorderColor, this.errorBorderColor, this.errorTextColor, this.hintTextColor, this.labelTextColor, this.textColor, this.fontSize, this.borderWidth, this.borderRadius, this.height, this.width});
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enabled;
  final bool? readOnly;
  final int? maxLength;
  final int? maxLines;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String?)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool? autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final Color? fillColor;
  final Color? cursorColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? disabledBorderColor;
  final Color? errorBorderColor;
  final Color? errorTextColor;
  final Color? hintTextColor;
  final Color? labelTextColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderWidth;
  final double? borderRadius;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      validator: validator,
      enabled: enabled ?? true,
      readOnly: readOnly ?? false,
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      focusNode: focusNode,
      autofocus: autofocus ?? false,
      cursorColor: cursorColor ?? Colors.black,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: fontSize ?? 14.sp,
      ),
      decoration: InputDecoration(
        contentPadding: contentPadding ?? const EdgeInsets.all(10),
        fillColor: fillColor ?? Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor ?? Colors.grey,
          fontSize: fontSize ?? 14.sp,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelTextColor ?? Colors.black,
          fontSize: fontSize ?? 14.sp,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide(
            color: enabledBorderColor ?? Colors.grey,
            width: borderWidth ?? 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide(
            color: focusedBorderColor ?? Colors.grey,
            width: borderWidth ?? 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide(
            color: disabledBorderColor ?? Colors.grey,
            width: borderWidth ?? 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide(
            color: errorBorderColor ?? Colors.red,
            width: borderWidth ?? 1,
          ),
        ),
        errorStyle: TextStyle(
          color: errorTextColor ?? Colors.red,
          fontSize: fontSize ?? 14.sp,
        ),
      ));
  }
}
