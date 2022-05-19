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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.03),
            borderRadius: BorderRadius.circular(10)),
        child: ExpansionTile(
          // controlAffinity: ListTileControlAffinity.leading,
          textColor: primaryColor,
          iconColor: primaryColor,
          collapsedIconColor: primaryColor,
          title: Row(
            children: [
              SvgPicture.asset(
                icon,
                color: primaryColor,
                width: 22,
              ),
              SizedBox(width: 20),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
