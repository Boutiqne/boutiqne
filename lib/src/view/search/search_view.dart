import 'package:boutiqnet/src/core/view_model/search_view_model.dart';
import 'package:boutiqnet/src/view/search/input_search.dart';
import 'package:boutiqnet/src/view/search/search_lodding.dart';
import 'package:boutiqnet/src/view/widgets/custom_text_form_field.dart';
import 'package:boutiqnet/src/view/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProducts extends StatelessWidget {
  const SearchProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'rehercher'.tr,
            style: Theme.of(context).textTheme.headline6,
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: GetBuilder<SearchViewModel>(
            init: SearchViewModel(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SearchInputFb2(
                        hintText: 'Que recherchez vous ?'.tr,
                        onChanged: (value) => controller.search(value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      (controller.isLodding)
                          ? const LoddingSearch()
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.7,
                                      mainAxisSpacing: 0.7),
                              itemCount: controller.productsSearch.length,
                              itemBuilder: (context, index) {
                                return ProductCard(
                                    product: controller.productsSearch[index]);
                              })
                    ],
                  ),
                ),
              );
            }));
  }
}
