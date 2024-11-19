import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../resources/resources.dart';

class AppButton extends StatefulWidget {
  final String buttonTitle;
  final GestureTapCallback onTap;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final Color? shadowColor;
  final double? textSize;
  final double? borderRadius;
  final double? borderWidth;
  final double? letterSpacing;
  final double? verticalPadding;
  final double? elevation;
  final FontWeight? fontWeight;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? horizontalMargin;
  final double? verticalMargin;

  final double? horizentalPadding;

  const AppButton(
      {super.key,
      required this.buttonTitle,
      required this.onTap,
      this.borderRadius,
      this.color,
      this.borderColor,
      this.textColor,
      this.borderWidth,
      this.textSize,
      this.letterSpacing,
      this.fontWeight,
      this.verticalPadding,
      this.elevation,
      this.shadowColor,
      this.buttonWidth,
      this.buttonHeight,
      this.horizentalPadding,
      this.horizontalMargin,
      this.verticalMargin});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: widget.horizontalMargin ?? 0,
          vertical: widget.verticalMargin ?? 0),
      height: widget.buttonHeight,
      width: widget.buttonWidth,
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          elevation: widget.elevation ?? 0,
          padding: EdgeInsets.zero,
          side: BorderSide(
              color: widget.borderColor ?? R.colors.transparent,
              width: widget.borderWidth ?? 1),
          backgroundColor: widget.color ?? R.colors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: widget.verticalPadding ?? 16,
              horizontal: widget.horizentalPadding ?? 0),
          child: Text(
            widget.buttonTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: widget.textSize ?? 16.sp,
                fontWeight: widget.fontWeight ?? FontWeight.w700,
                color: widget.textColor ?? R.colors.primaryColor,
                letterSpacing: widget.letterSpacing ?? 0.44),
          ),
        ),
      ),
    );
  }
}
