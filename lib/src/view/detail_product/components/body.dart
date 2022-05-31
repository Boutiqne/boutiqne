import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/core/view_model/product_view_model.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/view/detail_product/components/number_product.dart';
import 'package:boutiqnet/src/view/profile/components/profile_menu.dart';
import 'package:boutiqnet/src/view/profile/components/vendor_product.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductViewModel>(
        init: ProductViewModel(product.idVendore ?? '', product.colors[0]),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ProductImages(product: product),
                TopRoundedContainer(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ProductDescription(
                        product: product,
                        pressOnSeeMore: () {},
                      ),
                      TopRoundedContainer(
                        color: const Color(0xFFF6F7F9),
                        child: Column(
                          children: [
                            ColorDots(
                              colors: product.colors,
                              onChangeColor: (String color) {
                                controller.changeColor(color);
                              },
                            ),
                            SizedBox(height: getProportionateScreenHeight(20)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(20)),
                              child: NumberProduct(
                                title: "Nombre de produits",
                                defaultValue: 1,
                                onChangeValue: (v) {
                                  controller.changeNumber(v);
                                },
                              ),
                            ),
                            VendorProduct(
                              product: product,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
