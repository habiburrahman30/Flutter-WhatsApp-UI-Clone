import 'package:flutter/material.dart';

class KText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final int? maxLines;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  KText({
    required this.text,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.maxLines,
    this.fontWeight,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      textScaleFactor: 1.0,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontWeight: fontWeight != null ? fontWeight : FontWeight.normal,
        fontSize: fontSize != null ? fontSize : 14,
        fontFamily: fontFamily != null ? fontFamily : 'Roboto',
        color: color != null ? color : Colors.black87,
        letterSpacing: letterSpacing != null ? letterSpacing : 0.0,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
