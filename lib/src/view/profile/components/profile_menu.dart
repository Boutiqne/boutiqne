import 'package:boutiqnet/src/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.03),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: primaryColor,
              width: 22,
            ),
            SizedBox(width: 15),
            Text(text),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
