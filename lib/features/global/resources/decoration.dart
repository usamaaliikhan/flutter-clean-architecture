import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_clean/features/global/resources/resources.dart';

class AppDecoration {
  InputDecoration fieldDecoration(
      {Widget? preIcon,
      required String hintText,
      Color? hintTextColor,
      String? labelText,
      Widget? suffixIcon,
      double? radius,
      double? horizontalPadding,
      double? verticalPadding,
      double? iconMinWidth,
      Color? fillColor,
      Color? borderColor,
      FocusNode? focusNode,
      TextStyle? hintTextStyle,
      bool showCounter = false}) {
    return InputDecoration(
      counterText: showCounter ? null : '',
      prefixIconConstraints: BoxConstraints(
        minWidth: iconMinWidth ?? 42,
      ),
      suffixIconConstraints: BoxConstraints(
        minWidth: iconMinWidth ?? 42,
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 16, vertical: verticalPadding ?? 12),
      fillColor: fillColor ?? R.colors.primaryColor,
      hintText: hintText,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w300,
        color: hintTextColor ?? R.colors.hintColor,
        fontSize: 14.sp,
      ),
      errorMaxLines: 2,
      prefixIcon: preIcon,
      suffixIcon: suffixIcon != null ? Container(child: suffixIcon) : null,
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(
          color: borderColor ?? R.colors.white,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.white, width: 1.3),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.white, width: 1.3),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.white, width: 1.3),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.red, width: 1.3),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.red, width: 1.3),
      ),
      filled: true,
    );
  }
}
