import 'package:boutiqnet/src/constance.dart';
import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/view/detail_product/components/top_rounded_container.dart';
import 'package:boutiqnet/src/view/widgets/defaultbutton.dart';
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
      backgroundColor: Color(0xFFF5F6F9),
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
            top: getProportionateScreenWidth(15),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: (() {}),
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                  height: getProportionateScreenWidth(45),
                  width: getProportionateScreenWidth(45),
                  decoration: BoxDecoration(
                    color: product.isFavourite
                        ? primaryColor.withOpacity(0.15)
                        : kSecondaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Iconly-Bold-Heart.svg",
                    color:
                        product.isFavourite ? primaryColor : Color(0xFFDBDEE4),
                    height: getProportionateScreenWidth(16),
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              ),
              Expanded(
                child: Defaultbutton(
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
