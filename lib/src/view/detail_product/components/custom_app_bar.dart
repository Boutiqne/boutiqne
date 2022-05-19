import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(5)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    primary: primaryColor,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 20,
                  )),
            ),
            Spacer(),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(14),
            //   ),
            //   child: Row(
            //     children: [
            //       Text(
            //         "$rating",
            //         style: const TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //       const SizedBox(width: 5),
            //       SvgPicture.asset("assets/icons/Star Icon.svg"),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
