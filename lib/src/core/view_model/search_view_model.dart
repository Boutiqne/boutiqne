import 'package:boutiqnet/src/core/service/home_services.dart';
import 'package:boutiqnet/src/model/Product.dart';

import 'package:get/get.dart';

class SearchViewModel extends GetxController {
  bool isLodding = false;
  List<Product> productsSearch = [];

  // search products
  search(String value) {
    isLodding = true;
    update();
    print('-----------$value----------');
    HomeService().searchProduct(value).then((products) {
      productsSearch = [];
      print(products.length);
      for (int i = 0; i < products.length; i++) {
        Map<dynamic, dynamic> proctJson =
            products[i].data() as Map<dynamic, dynamic>;

        productsSearch.add(Product.fromJson(proctJson));
      }
      isLodding = false;
      print('products  search getting');
      update();
    });
  }
}
