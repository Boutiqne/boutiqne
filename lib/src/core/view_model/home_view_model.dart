import 'package:boutiqnet/src/core/service/home_services.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/model/category_model.dart';

import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  bool get loading => _loading;
  bool _loading = false;

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<Product> get products => _products;
  List<Product> _products = [];
  List<Product> get annoncesProducts => _annoncesProducts;
  List<Product> _annoncesProducts = [];

  @override
  void onInit() {
    super.onInit();
    // FirebaseAuth.instance.signOut();
    getAnnonceProducts();
    // addProduct(productModel);
  }

  getCategory() async {
    _loading = true;
    update();
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading = false;
      }
      update();
    });
  }

  getProducts() async {
    HomeService().getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        Map<dynamic, dynamic> proctJson =
            value[i].data() as Map<dynamic, dynamic>;

        products.add(Product.fromJson(proctJson));
      }

      print('products getting');
      update();
    });
  }

  getAnnonceProducts() async {
    _loading = true;
    update();
    HomeService().getAnnonceProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        Map<dynamic, dynamic> proctJson =
            value[i].data() as Map<dynamic, dynamic>;
        annoncesProducts.add(Product.fromJson(proctJson));
      }
      _loading = false;
      print('Annonce products getting');
      update();
      getProducts();
    });
  }

  // add product to firebase
  addProduct(Product productModel) async {
    _loading = true;
    update();
    HomeService().addProduct(productModel).then((value) {
      _loading = false;
      update();
    });
  }
}
