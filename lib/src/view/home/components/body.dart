import 'package:boutiqnet/src/helper/size_config.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'new_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: (15)),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              const HomeHeader(),
              SizedBox(height: getProportionateScreenHeight(20)),
              // DiscountBanner(),
              Categories(),
              SizedBox(height: getProportionateScreenHeight(20)),
              SpecialOffers(),
              SizedBox(height: getProportionateScreenHeight(20)),
              PopularProducts(),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
