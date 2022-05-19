import 'dart:async';

import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/view/auth/login_view.dart';
import 'package:boutiqnet/src/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 1000), () {
      SizeConfig().init(context);
      if (FirebaseAuth.instance.currentUser != null) {
        Get.off(() => ControlView());
      } else {
        Get.off(() => LoginView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          Image.asset(
            'assets/images/logo.png',
            height: 80,
          ),
          SpinKitRing(
            color: primaryColor,
            lineWidth: 2,
            size: 30,
          ),
        ],
      ),
    );
  }
}
