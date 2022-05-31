import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/core/service/firestore_likes.dart';
import 'package:boutiqnet/src/core/view_model/likes_view_model.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/view/detail_product/details_screen.dart';
import 'package:boutiqnet/src/view/widgets/like_product.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

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
                  padding: const EdgeInsets.all((20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ImageNetwork(
                    image: product.images[0],
                    imageCache: CachedNetworkImageProvider(product.images[0]),
                    onError: const Icon(
                      Icons.error,
                      color: Colors.grey,
                    ),
                    width: 120,
                    height: 120,
                    curve: Curves.easeIn,
                    onPointer: true,
                    debugPrint: false,
                    fullScreen: false,
                    fitAndroidIos: BoxFit.cover,
                    fitWeb: BoxFitWeb.contain,
                    borderRadius: BorderRadius.circular(10),
                    onLoading: const CircularProgressIndicator.adaptive(),
                    onTap: () {
                      Get.to(
                        () => DetailsScreen(
                          product: product,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title ?? '',
                style: const TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${product.price} um",
                    style: const TextStyle(
                      fontSize: (18),
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

