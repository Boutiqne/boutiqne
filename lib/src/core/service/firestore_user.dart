import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:boutiqnet/src/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  // get firebase user
  Future<UserModel> getUserFromFireStore(String userId) async {
    final DocumentSnapshot _userSnapshot =
        await _userCollectionRef.doc(userId).get();
    return UserModel.fromJson(_userSnapshot.data() as Map<String, dynamic>);
  }
}
