import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/core/service/firestore_likes.dart';
import 'package:boutiqnet/src/core/view_model/likes_view_model.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/view/detail_product/details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () {
            Get.to(
              () => DetailsScreen(
                product: product,
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.dateCreate,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: product.images[0],
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      width: getProportionateScreenWidth(80),
                      height: getProportionateScreenWidth(75),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title ?? '',
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${product.price} um",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                  LikeWidget(product: product),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
          ? SpinKitRing(
              color: primaryColor,
              lineWidth: 2,
              size: getProportionateScreenWidth(20),
            )
          : Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              height: getProportionateScreenWidth(28),
              width: getProportionateScreenWidth(28),
              decoration: BoxDecoration(
                color: isLike
                    ? primaryColor.withOpacity(0.15)
                    : kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "assets/icons/Iconly-Bold-Heart.svg",
                color: isLike ? primaryColor : Color(0xFFDBDEE4),
              ),
            ),
    );
  }
}
