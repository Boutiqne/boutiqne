import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/core/view_model/auth_view_model.dart';
import 'package:boutiqnet/src/core/view_model/control_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: primaryColor.withOpacity(0.1)),
          child: NavigationBar(
            selectedIndex: controller.navigatorValue,
            onDestinationSelected: (index) {
              controller.changeSelectedValue(index);
            },
            backgroundColor: Colors.grey.shade50,
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/Iconly-Curved-Home.svg',
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/Iconly-Bold-Home.svg',
                ),
                label: 'home'.tr,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/Iconly-Curved-Search.svg',
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/Iconly-Bold-Search.svg',
                ),
                label: 'rechercher'.tr,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/Iconly-Curved-Heart.svg',
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/Iconly-Bold-Heart.svg',
                ),
                label: 'favories'.tr,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/Iconly-Curved-Notification.svg',
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/Iconly-Bold-Notification.svg',
                ),
                label: 'notifications'.tr,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  'assets/icons/Iconly-Curved-Profile.svg',
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/Iconly-Bold-Profile.svg',
                ),
                label: 'compte'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
