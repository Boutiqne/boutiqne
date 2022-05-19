import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(63, 81, 181, 1);

const kPrimaryLightColor = Color.fromARGB(255, 200, 207, 245);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xff3f51b5), Color.fromARGB(255, 2, 64, 115)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const defaultDuration = Duration(milliseconds: 250);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);


