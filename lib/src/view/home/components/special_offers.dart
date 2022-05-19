import 'package:boutiqnet/src/constance.dart';

import 'package:boutiqnet/src/core/view_model/home_view_model.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/view/detail_product/details_screen.dart';
import 'package:boutiqnet/src/view/view_all/view_all_product.dart';
import 'package:boutiqnet/src/view/widgets/product_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
        SizedBox(height: getProportionateScreenWidth(20)),
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
      width: getProportionateScreenWidth(280),
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
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
              Column(
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
                  SizedBox(
                    width: getProportionateScreenWidth(170),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            "${product.price} um",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
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
            ],
          ),
        ),
      ),
    );
  }
}
