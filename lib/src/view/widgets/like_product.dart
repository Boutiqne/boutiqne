import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/core/service/firestore_likes.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeWidget extends StatefulWidget {
  const LikeWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  bool islodding = false;
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isLike) {
          setState(() {
            islodding = true;
          });
          await FireStoreLikes().unlike(
              FirebaseAuth.instance.currentUser?.uid ?? '',
              widget.product.id ?? '');
          setState(() {
            isLike = false;
            islodding = false;
          });
        } else {
          setState(() {
            islodding = true;
          });
          await FireStoreLikes().addLikesProduct(
              FirebaseAuth.instance.currentUser?.uid ?? '', widget.product);
          setState(() {
            islodding = false;
            isLike = !isLike;
          });
        }
      },
      child: (islodding)
          ? Container(
              padding: const EdgeInsets.all((8)),
              height: (28),
              width: (28),
              child: const SpinKitRing(
                color: primaryColor,
                lineWidth: 2,
                size: (20),
              ),
            )
          : Container(
              padding: const EdgeInsets.all((8)),
              height: (28),
              width: (28),
              decoration: BoxDecoration(
                color: isLike
                    ? primaryColor.withOpacity(0.15)
                    : kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "assets/icons/Iconly-Bold-Heart.svg",
                color: isLike ? primaryColor : const Color(0xFFDBDEE4),
              ),
            ),
    );
  }
}
