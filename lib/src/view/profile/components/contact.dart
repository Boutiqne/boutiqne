import 'package:boutiqnet/src/constance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

getContact() {
  Get.bottomSheet(
    Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Get.theme.primaryColor.withOpacity(0.2)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Conctacts'.tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ItemContact(
              onTap: () async {
                await callPhoneNumber('36323512');
              },
              title: 'Téléphone'.tr,
              value: '36323512',
            ),
            const SizedBox(height: 10),
            ItemContact(
              onTap: () async {
                await openWebsite('wa.me/message/jqher7eukfojg1');
              },
              title: 'Whatsapp'.tr,
              value: '36323512',
            ),
            const SizedBox(height: 10),
            ItemContact(
              onTap: () async {
                await openWebsite('www.boutiqnet.net');
              },
              title: 'Site'.tr,
              value: 'www.boutiqnet.net',
            ),
            const SizedBox(height: 10),
            ItemContact(
              onTap: () {
                sendEmail('boutiqnet@gmail.com');
              },
              // controller.launchContact(
              //     type: 'email', contact: 'e-ticket@stp.mr'),
              title: 'Email'.tr,
              value: 'boutiqnet@gmail.com',
            ),
            const SizedBox(height: 10),
          ],
        )),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    elevation: 10,
    backgroundColor: Colors.white,
    isScrollControlled: true,
  );
}

class ItemContact extends StatelessWidget {
  ItemContact(
      {Key? key, required this.onTap, required this.title, required this.value})
      : super(key: key);

  final String title;

  final String value;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.5,
          // color: achat.primaryColor == null
          //     ? Colors.black
          //     : achat.primaryColor!.toColor(),
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.2),

            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(1, 2), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: Get.theme.primaryColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward,
              size: 14,
              color: Get.theme.primaryColor.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}

// ------------------------------ contact --------

// launch to phone number
Future<void> callPhoneNumber(String phoneNumber) async {
  String phone = "tel:$phoneNumber";
  if (await canLaunchUrlString(phone)) {
    await launch(phone);
  } else {
    throw 'Could not launch $phone';
  }
}

// launch to email
Future<void> sendEmail(String email) async {
  String mail = "mailto:$email";
  if (await canLaunchUrlString(mail)) {
    await launch(mail);
  } else {
    throw 'Could not launch $mail';
  }
}

// launch to website
Future<void> openWebsite(String website) async {
  String url = "https://$website";
  if (await canLaunchUrlString(url)) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
