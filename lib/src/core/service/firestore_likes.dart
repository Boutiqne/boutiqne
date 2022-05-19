import 'package:boutiqnet/src/model/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreLikes {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<QuerySnapshot<Map<String, dynamic>>> getLikesProduct(String id) async {
    return await _userCollectionRef.doc(id).collection('likes').get();
  }

  Future<void> addLikesProduct(String id, Product product) async {
    await _userCollectionRef
        .doc(id)
        .collection('likes')
        .doc(product.id)
        .set(product.toJson());
  }

  // remove product from firebase
  Future<void> unlike(String id, String productId) async {
    await _userCollectionRef
        .doc(id)
        .collection('likes')
        .doc(productId)
        .delete();
  }
}
