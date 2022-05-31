import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/core/view_model/home_view_model.dart';
import 'package:boutiqnet/src/core/view_model/product_view_model.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/view/detail_product/components/top_rounded_container.dart';
import 'package:boutiqnet/src/view/search/search_lodding.dart';
import 'package:boutiqnet/src/view/view_all/view_all_product.dart';

import 'package:boutiqnet/src/view/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// GridView.builder(
//           gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, ) ,
class VendorProduct extends StatelessWidget {
  final Product product;

  const VendorProduct({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TopRoundedContainer(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    "assets/icons/Icon-awesome-store-alt.svg",
                    color: primaryColor,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  product.nameVandore ?? "",
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          GetBuilder<ProductViewModel>(builder: (controller) {
            return (controller.lodding)
                ? const LoddingSearch()
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 3 : 2,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      // if (controller.products[index].isAnnonces)
                      return ProductCard(product: controller.products[index]);

                      // return SizedBox.shrink(); // here by default width and height is 0
                    });
          })
        ],
      ),
    );
  }
}
