import 'package:boutiqnet/src/model/address.dart';

class UserModel {
  String? userId, email, name, pic, phone;
  Address? address;
  double? prix;
  UserModel(
      {this.userId,
      this.prix,
      this.email,
      this.name,
      this.pic,
      this.address,
      this.phone});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
    phone = map['phone'];
    prix = map['prix'];
    address = Address.fromJson(map['address']);
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'phone': phone,
      'address': address?.toJson(),
      'prix': prix
    };
  }
}
