import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:flutter/material.dart';

import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        // Image.asset(
        //   'assets/images/logo.png',
        //   height: getProportionateScreenWidth(20),
        // ),
        // const SizedBox(width: 10),
        Text(
          'Boutiqnet',
          style: TextStyle(
            fontSize: (25),
            fontWeight: FontWeight.w900,
            color: primaryColor,
          ),
        )
      ],
    );
  }
}
