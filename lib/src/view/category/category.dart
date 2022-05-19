import 'package:boutiqnet/src/core/view_model/category_view_model.dart';
import 'package:boutiqnet/src/model/category_model.dart';

import 'package:boutiqnet/src/view/notification/notification_lodding.dart';

import 'package:boutiqnet/src/view/widgets/product_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsByCategory extends StatelessWidget {
  const ProductsByCategory({Key? key, required this.category})
      : super(key: key);
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          category.name?.tr ?? '',
          style: Theme.of(context).textTheme.headline6,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: GetBuilder<CategorysViewModel>(
          init: CategorysViewModel(),
          builder: (controller) {
            if (controller.isInit) {
              controller.getProductsbyCatagory(category.id ?? 0);
            }
            return (controller.isInit)
                ? LoddingNotification()
                : GridView.builder(
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
                    });
          }),
    );
  }
}
