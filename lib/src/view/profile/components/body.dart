import 'package:boutiqnet/src/view/auth/login_view.dart';
import 'package:boutiqnet/src/view/profile/components/contact.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          ProfilePic(),
          // SizedBox(height: 20),
          // ProfileMenu(
          //   text: "Compte".tr,
          //   icon: 'assets/icons/Iconly-Curved-Profile.svg',
          //   press: () => {},
          // ),
          // ProfileMenu(
          //   text: "changer la langue".tr,
          //   icon: "assets/icons/Settings.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: 'Créer votre boutique'.tr,
            icon: "assets/icons/Icon-awesome-store-alt.svg",
            press: () {},
          ),

          ProfileMenu(
            text: 'Contactez nous'.tr,
            icon: "assets/icons/Iconly-Curved-Calling.svg",
            press: () {
              getContact();
            },
          ),
          ProfileMenu(
            text: 'Termes et Conditions'.tr,
            icon: "assets/icons/Iconly-Curved-Paper.svg",
            press: () {},
          ),
          ProfileMenu(
            text: 'Aide'.tr,
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Noter L'application".tr,
            icon: "assets/icons/Iconly-Broken-Star.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Se deconnecter".tr,
            icon: "assets/icons/Iconly-Curved-Logout.svg",
            press: () {
              FirebaseAuth.instance.signOut();
              Get.offAll(() => LoginView());
            },
          ),
        ],
      ),
    );
  }
}
