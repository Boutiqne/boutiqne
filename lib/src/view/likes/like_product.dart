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

class LikeProductCard extends StatelessWidget {
  const LikeProductCard({Key? key, required this.product, required this.index})
      : super(key: key);

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(120),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(10)),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => DetailsScreen(
              product: product,
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: product.images[0],
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: getProportionateScreenWidth(80),
                  height: getProportionateScreenWidth(75),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        product.title ?? '',
                        style: TextStyle(color: Colors.black),
                        maxLines: 2,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        product.nameVandore ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${product.price} um",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                        Spacer(),
                        RemoveWidget(
                          product: product,
                          index: index,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RemoveWidget extends StatefulWidget {
  const RemoveWidget({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final Product product;
  final int index;

  @override
  State<RemoveWidget> createState() => _RemoveWidgetState();
}

class _RemoveWidgetState extends State<RemoveWidget> {
  bool islodding = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          islodding = true;
        });
        await FireStoreLikes().unlike(
            FirebaseAuth.instance.currentUser?.uid ?? '',
            widget.product.id ?? '');
        setState(() {
          islodding = false;
        });
        LikesViewModel likesViewModel = Get.find();
        likesViewModel.removeLike(widget.index);
      },
      child: (islodding)
          ? SpinKitRing(
              color: primaryColor,
              lineWidth: 2,
              size: getProportionateScreenWidth(20),
            )
          : Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(6)),
              height: getProportionateScreenWidth(24),
              width: getProportionateScreenWidth(24),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "assets/icons/Iconly-Bold-Delete.svg",
                color: primaryColor.withOpacity(0.5),
              ),
            ),
    );
  }
}
