import 'package:boutiqnet/src/core/view_model/home_view_model.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/view/view_all/view_all_product.dart';

import 'package:boutiqnet/src/view/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'section_title.dart';

// GridView.builder(
//           gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, ) ,
class PopularProducts extends StatelessWidget {
  HomeViewModel controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
            title: 'Nouveaux produits'.tr,
            press: () {
              Get.to(() => ViewAllProduct(title: 'Nouveaux produits'));
            }),
        SizedBox(height: getProportionateScreenWidth(20)),
        GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              // if (controller.products[index].isAnnonces)
              return ProductCard(product: controller.products[index]);

              // return SizedBox.shrink(); // here by default width and height is 0
            })
      ],
    );
  }
}
