import 'package:boutiqnet/src/model/Product.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Products');

  final CollectionReference _annocesProduct =
      FirebaseFirestore.instance.collection('Products_annonces');
  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.limitToLast(20).get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _productCollectionRef.get();

    return value.docs;
  }

//  get annonces product
  Future<List<QueryDocumentSnapshot>> getAnnonceProduct() async {
    var value = await _annocesProduct.get();

    return value.docs;
  }

  // add product to firebase
  addProduct(Product product) async {
    await _annocesProduct
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(product.toJson());
  }

  // get products by id Category
  Future<List<QueryDocumentSnapshot<Object?>>> getProductsbyCatagory(int id) async {
    var products = await _productCollectionRef
        .where('categorie', arrayContains: id)
        .limit(20)
        .get();
    return products.docs;
  }

  // search product
  searchProduct(String search) async {
    var products = await _productCollectionRef
        .orderBy('title')
        .startAt([search])
        .limit(10)
        .get();
    return products.docs;
  }
}
