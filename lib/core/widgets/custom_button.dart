import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.backGroundColor,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final Color backGroundColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback?onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(18),
          ),
          backgroundColor: backGroundColor,
        ),
        child: Text(
          text,
          style: TextStyles.textStyle20.copyWith(
            color: textColor,
            fontWeight: fontWeight ?? FontWeight.w800,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
