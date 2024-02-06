import 'dart:math';

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double minFontSize;
  final double maxFontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText({
    super.key,
    required this.text,
    this.minFontSize = 12.0,
    this.maxFontSize = 24.0,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double scaleFactor =
            screenWidth / 360; // Adjust the base width as needed

        double fontSize = max(minFontSize, min(maxFontSize, 16 * scaleFactor));

        return Text(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        );
      },
    );
  }
}
