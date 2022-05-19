import 'package:boutiqnet/src/core/service/home_services.dart';
import 'package:boutiqnet/src/model/Product.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategorysViewModel extends GetxController {
  bool lodding = true;
  bool isInit = true;

  List<Product> get products => _products;
  List<Product> _products = [];

  @override
  void onInit() {
    // addCategorys(Notifcation(
    //     created: DateTime.now().millisecondsSinceEpoch,
    //     title: 'Hey Mohmed',
    //     message:
    //         'Create an account and unlock free shipping for your first two orders. Sign up now!'));
    super.onInit();
  }

  // get product from server
  void getProductsbyCatagory(int id) async {
    HomeService().getProductsbyCatagory(id).then((value) {
      for (int i = 0; i < value.length; i++) {
        Map<dynamic, dynamic> proctJson =
            value[i].data() as Map<dynamic, dynamic>;

        products.add(Product.fromJson(proctJson));
      }
      lodding = false;
      isInit = false;

      print('products by category  getting');
      update();
    });
  }
}
