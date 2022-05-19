import 'package:boutiqnet/src/model/address.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VendorModel {
  String? userId, email, name, pic, phone ;
  Address? address;
  VendorModel({this.userId, this.email, this.name, this.pic ,adress});

  VendorModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
    phone = map['phone'];
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
    };
  }
}

