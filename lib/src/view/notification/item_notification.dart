import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/model/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.notification})
      : super(key: key);
  final Notifcation notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.2),

            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(1, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    notification.title ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                    DateTime.fromMillisecondsSinceEpoch(
                            notification.created ?? 0,
                            isUtc: true)
                        .toString()
                        .substring(0, 16),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              notification.message ?? '',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
