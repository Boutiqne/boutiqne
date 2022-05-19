import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomBorderButton extends StatelessWidget {
  final String text;

  final Color color;
  final Color textColor;

  final Function onPress;

  CustomBorderButton(
      {required this.onPress,
      this.text = 'Write text ',
      this.color = primaryColor,
      this.textColor = primaryColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress as void Function()?,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: color, width: 1.5)),
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: text,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
