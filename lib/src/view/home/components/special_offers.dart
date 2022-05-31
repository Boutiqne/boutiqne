import 'package:boutiqnet/src/constance.dart';

import 'package:boutiqnet/src/core/view_model/home_view_model.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/view/detail_product/details_screen.dart';
import 'package:boutiqnet/src/view/view_all/view_all_product.dart';
import 'package:boutiqnet/src/view/widgets/like_product.dart';
import 'package:boutiqnet/src/view/widgets/product_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  SpecialOffers({
    Key? key,
  }) : super(key: key);
  HomeViewModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "Recommandation - annonces".tr,
          press: () {
            Get.to(() => ViewAllProduct(title: "Recommandation - annonces"));
          },
        ),
        const SizedBox(height: (20)),
        SizedBox(
          height: getProportionateScreenHeight(80),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.annoncesProducts.length,
            itemBuilder: (context, index) {
              return SpecialOfferCard(
                product: controller.annoncesProducts[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (300),
      padding: const EdgeInsets.symmetric(horizontal: (10)),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => DetailsScreen(
              product: product,
            ),
          );
        },
        child: Row(
          children: [
            ImageNetwork(
              image: product.images[0],
              imageCache: CachedNetworkImageProvider(product.images[0]),
              onError: const Icon(
                Icons.error,
                color: Colors.grey,
              ),
              width: (80),
              height: (75),
              curve: Curves.easeIn,
              onPointer: true,
              debugPrint: false,
              fullScreen: false,
              fitAndroidIos: BoxFit.cover,
              fitWeb: BoxFitWeb.contain,
              borderRadius: BorderRadius.circular(10),
              onLoading: const CircularProgressIndicator(
                color: primaryColor,
              ),
              onTap: () {
                Get.to(
                  () => DetailsScreen(
                    product: product,
                  ),
                );
              },
            ),
            const SizedBox(
              width: (10),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? '',
                    style: const TextStyle(color: Colors.black),
                    maxLines: 2,
                  ),
                  SizedBox(
                    width: (170),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            "${product.price} um",
                            style: const TextStyle(
                              fontSize: (16),
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        LikeWidget(product: product),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
