import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextGradiant extends StatelessWidget {
  final String? text;

  final double fontSize;

  final int? maxLine;

  CustomTextGradiant({
    this.text = '',
    this.fontSize = 16,
    this.maxLine,
  });
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff3f51b5), Color.fromRGBO(63, 81, 181, 1)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        foreground: Paint()..shader = linearGradient,
      ),
      maxLines: maxLine,
    );
  }
}
