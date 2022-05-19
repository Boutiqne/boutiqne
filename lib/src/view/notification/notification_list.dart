import 'package:boutiqnet/src/core/service/firestore_likes.dart';
import 'package:boutiqnet/src/core/view_model/likes_view_model.dart';
import 'package:boutiqnet/src/core/view_model/notification_view_model.dart';
import 'package:boutiqnet/src/view/home/components/special_offers.dart';
import 'package:boutiqnet/src/view/notification/notification_lodding.dart';
import 'package:boutiqnet/src/view/likes/like_product.dart';
import 'package:boutiqnet/src/view/notification/item_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'notification'.tr,
          style: Theme.of(context).textTheme.headline6,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<NotificationsViewModel>(
          init: NotificationsViewModel(),
          builder: (controller) {
            return (controller.isInit)
                ? LoddingNotification()
                : ListView.builder(
                    itemCount: controller.notifications.length,
                    itemBuilder: (context, index) {
                      return NotificationItem(
                        notification: controller.notifications[index],
                      );
                    },
                  );
          }),
    );
  }
}
