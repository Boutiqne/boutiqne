import 'package:boutiqnet/src/core/view_model/home_view_model.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/view/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ViewAllProduct extends StatelessWidget {
  ViewAllProduct({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  HomeViewModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    print('printtttt test');
    List<Product> products = ('Nouveaux produits' == title)
        ? controller.products
        : controller.annoncesProducts;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white38,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          title.tr,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            // if (controller.products[index].isAnnonces)
            return ProductCard(product: products[index]);

            // return SizedBox.shrink(); // here by default width and height is 0
          }),
    );
  }
}
