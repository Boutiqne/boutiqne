import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/view/detail_product/components/top_rounded_container.dart';
import 'package:boutiqnet/src/view/widgets/defaultbutton.dart';
import 'package:boutiqnet/src/view/widgets/like_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(),
      ),
      body: Body(product: product),
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: getProportionateScreenWidth(40),
            top: getProportionateScreenWidth(5),
          ),
          child: Row(
            children: [
              LikeWidget(product: product),
              SizedBox(
                width: getProportionateScreenWidth(20),
              ),
              Expanded(
                child: Defaultbutton(
                  height: 38,
                  text: "Achetez".tr,
                  textcolor: Colors.white,
                  color: primaryColor,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
