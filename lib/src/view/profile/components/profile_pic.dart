import 'dart:ui';

import 'package:boutiqnet/src/constance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 115,
        child: Row(
          children: [
            CircleAvatar(
              minRadius: 32,
              backgroundColor: primaryColor.withOpacity(0.2),
              child: SvgPicture.asset(
                'assets/icons/Iconly-Curved-Profile.svg',
                width: 18,
                color: primaryColor,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    '${FirebaseAuth.instance.currentUser?.displayName}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${FirebaseAuth.instance.currentUser?.phoneNumber}'
                      .substring(4),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ],
            )
          ],
        ));
  }
}
