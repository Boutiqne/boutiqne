import 'package:boutiqnet/src/core/service/firestore_notification.dart';

import 'package:boutiqnet/src/model/notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NotificationsViewModel extends GetxController {
  bool lodding = true;
  bool isInit = true;
  List<Notifcation> get notifications => _notifications;
  List<Notifcation> _notifications = [];
  User? _user = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    getNotificationsProducts();
    // addNotifications(Notifcation(
    //     created: DateTime.now().millisecondsSinceEpoch,
    //     title: 'Hey Mohmed',
    //     message:
    //         'Create an account and unlock free shipping for your first two orders. Sign up now!'));
    super.onInit();
  }

  // get product from server
  void getNotificationsProducts() async {
    if (_user?.uid != null) {
      QuerySnapshot<Map<String, dynamic>> val = await FireStoreNotifications()
          .getNotificationsProduct(_user?.uid ?? '');
      val.docs.forEach((element) {
        _notifications.add(Notifcation.fromJson(element.data()));
      });
    }
    lodding = false;
    isInit = false;
    update();
  }

  Future<void> addNotifications(Notifcation notifcation) async {
    if (_user?.uid != null)
      await FireStoreNotifications()
          .addNotifications(_user?.uid ?? '', notifcation);
  }
}
