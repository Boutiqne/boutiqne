

// adress class
import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  String? city, moukata;
  GeoPoint? address;
  Address({this.address, this.city, this.moukata});
  // to json
  toJson() {
    return {
      'address': address,
      'city': city,
      'moukata': moukata,
    };
  }

  // from json
   Address.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    address = map['address'];
    city = map['city'];
    moukata = map['moukata'];
  }
}
