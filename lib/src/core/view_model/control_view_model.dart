import 'package:boutiqnet/src/view/auth/login_view.dart';

import 'package:boutiqnet/src/view/home/home_screen.dart';
import 'package:boutiqnet/src/view/likes/likes_list.dart';
import 'package:boutiqnet/src/view/notification/notification_list.dart';
import 'package:boutiqnet/src/view/profile/profile_screen.dart';
import 'package:boutiqnet/src/view/search/search_view.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;
  User? user = FirebaseAuth.instance.currentUser;
  Widget currentScreen = HomeScreen();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          currentScreen = const SearchProducts();

          break;
        }
      case 2:
        {
          if (user != null) {
            currentScreen = const LikesList();
          } else {
            Get.to(() => LoginView());
          }

          break;
        }
      case 3:
        {
          if (user != null) {
            currentScreen = const NotificationList();
          } else {
            Get.to(() => LoginView());
          }

          break;
        }
      case 4:
        {
          if (user != null) {
            currentScreen = ProfileScreen();
          } else {
            Get.to(() => LoginView());
          }
          break;
        }
    }
    update();
  }

  // sign out
  void signOut() async {
    await FirebaseAuth.instance.signOut();
    print('-----out-------');
    Get.offAll(LoginView());
  }
}
