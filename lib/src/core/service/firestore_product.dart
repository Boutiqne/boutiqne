import 'package:boutiqnet/src/model/Product.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDemande {
  final CollectionReference _demandeProductRef =
      FirebaseFirestore.instance.collection('demande_product');
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Products');

  Future<DocumentSnapshot<Object?>> getDemandeProduct(String id) async {
    return await _demandeProductRef.doc(id).get();
  }

  Future<void> addDemandeProduct(String id, Product product) async {
    await _demandeProductRef.doc(id).set(product.toJson());
  }

  Future<List<QueryDocumentSnapshot<Object?>>> getProductbyIdVendore(
      String id) async {
    var products = await _productCollectionRef
        .where('idVendore', isEqualTo: id)
        .limit(20)
        .get();

    return products.docs;
  }
}
