import 'package:boutiqnet/src/core/service/firestore_notification.dart';
import 'package:boutiqnet/src/core/service/firestore_product.dart';
import 'package:boutiqnet/src/model/Product.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductViewModel extends GetxController {
  bool lodding = true;
  bool isInit = true;
  int number = 1;
  String? selectcolor;
  final User? _user = FirebaseAuth.instance.currentUser;
  List<Product> get products => _products;
  List<Product> _products = [];
  ProductViewModel(String id, this.selectcolor) {
    getProductbyIdVendore(id);
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> addDemande(Product product) async {
    if (_user?.uid != null) {
      await FireStoreDemande().addDemandeProduct(_user?.uid ?? '', product);
    }
  }

  // change color of product
   changeColor(String color) {
    selectcolor = color;
    print(selectcolor);
  }

  // change the number of product
  void changeNumber(int number) {
    this.number = number;
    print(number);
  }

  // get product by id vendore
  Future getProductbyIdVendore(String id) async {
    await FireStoreDemande().getProductbyIdVendore(id).then((value) {
      for (int i = 0; i < value.length; i++) {
        Map<dynamic, dynamic> proctJson =
            value[i].data() as Map<dynamic, dynamic>;

        _products.add(Product.fromJson(proctJson));
      }

      print('products getting by idvendore');
      lodding = false;
      update();
    });
  }
}
