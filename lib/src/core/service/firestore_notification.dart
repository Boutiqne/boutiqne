import 'package:boutiqnet/src/model/Product.dart';
import 'package:boutiqnet/src/model/notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreNotifications {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<QuerySnapshot<Map<String, dynamic>>> getNotificationsProduct(String id) async {
    return await _userCollectionRef.doc(id).collection('Notifications').get();
  }

  Future<void> addNotifications(String id, Notifcation notifcation) async {
    await _userCollectionRef
        .doc(id)
        .collection('Notifications')
        .doc(notifcation.id)
        .set(notifcation.toJson());
  }

  
}
