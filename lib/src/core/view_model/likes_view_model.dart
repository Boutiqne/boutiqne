import 'package:boutiqnet/src/core/service/firestore_likes.dart';
import 'package:boutiqnet/src/model/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LikesViewModel extends GetxController {
  bool lodding = true;
  List<Product> get likesProducts => _likesProducts;
  List<Product> _likesProducts = [];
  User? _user = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    getLikesProducts();
    super.onInit();
  }

  // get product from server
  void getLikesProducts() async {
    if (_user?.uid != null) {
      QuerySnapshot<Map<String, dynamic>> val =
          await FireStoreLikes().getLikesProduct(_user?.uid ?? '');
      val.docs.forEach((element) {
        _likesProducts.add(Product.fromJson(element.data()));
      });
    }
    lodding = false;
    update();
  }

  addLike(Product product) async {
    await FireStoreLikes().addLikesProduct(_user?.uid ?? '', product);
  }

  removeLike(int index) async {
    _likesProducts.removeAt(index);
    update();
  }
}
