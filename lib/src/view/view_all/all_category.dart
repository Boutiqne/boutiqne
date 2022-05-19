import 'package:boutiqnet/src/core/view_model/home_view_model.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/model/category_model.dart';
import 'package:boutiqnet/src/view/home/components/categories.dart';
import 'package:boutiqnet/src/view/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ViewAllCategory extends StatelessWidget {
  const ViewAllCategory({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
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
            crossAxisCount: 4,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) => CategoryCard(
            categoryModel: categories[index],
          ),
        ));
  }
}
