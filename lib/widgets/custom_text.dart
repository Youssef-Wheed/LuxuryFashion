import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.fontWeight,
    this.spacing = 0.0,
  });
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        letterSpacing: spacing,
        fontWeight: fontWeight,
        fontFamily: "TenorSans",
      ),
    );
  }
}
