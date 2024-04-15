import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CAText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDirection? textDirection;

  const CAText(
      this.text, {
        Key? key,
        this.style,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.textDirection,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? const TextStyle(fontSize: 16.0), // Default font size
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines ?? 1,
      textDirection: textDirection,
    );
  }
}