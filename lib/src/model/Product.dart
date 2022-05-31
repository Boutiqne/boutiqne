import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Map<String, Product> offerFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, Product>(k, Product.fromJson(v)));

// list of Offre to json
String offerToString(List<Product> data) =>
    json.encode(data.map((e) => e.toJson()).toList());

// String offerToJson(Map<String, Offre> data) => json.encode(
//     Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Product {
  int? quantity;
  String? id, title, description, marque, type, idVendore, nameVandore;
  List<dynamic> images, colors;

  List<dynamic> subCategorie, categorie;
  Timestamp dateCreate;
  num price;
  bool isFavourite, isAnnonces;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.isFavourite = false,
    this.isAnnonces = false,
    required this.title,
    required this.price,
    required this.description,
    required this.categorie,
    required this.marque,
    required this.subCategorie,
    required this.dateCreate,
    required this.quantity,
    required this.idVendore,
    required this.nameVandore,
  });

  factory Product.fromJson(Map<Object?, dynamic> json) {
    return Product(
      id: json['id'],
      images: json['images'],
      colors: json['colors'] ?? [],
      isFavourite: json['isFavourite'],
      isAnnonces: json['isAnnonces'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      categorie: json['categorie'] ?? [],
      marque: json['marque'],
      subCategorie: json['subCategorie'] ?? [],
      dateCreate: json['dateCreate'],
      quantity: json['quantity'],
      idVendore: json['idVendore'],
      nameVandore: json['nameVandore'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'images': images,
        'colors': colors,
        'isFavourite': isFavourite,
        'isAnnonces': isAnnonces,
        'title': title,
        'price': price,
        'description': description,
        'categorie': categorie,
        'marque': marque,
        'type': type,
        'subCategorie': subCategorie,
        'dateCreate': dateCreate,
        'quantity': quantity,
        'idVendor': idVendore,
        'nameVandore': nameVandore,
      };
}

// Our demo Products

// List<Product> demoProducts = [
//   Product(
//       id: 1,
//       images: [
//         "assets/images/ps4_console_white_1.png",
//         "assets/images/ps4_console_white_2.png",
//         "assets/images/ps4_console_white_3.png",
//         "assets/images/ps4_console_white_4.png",
//       ],
//       colors: [
//         'F6625E',
//         '836DB8',
//         'DECB9C',
//       ],
//       title: "Wireless Controller for PS4™",
//       price: 64.99,
//       description: description,
//       isFavourite: true,
//       isAnnonces: true,
//       marque: "Sony",
//       categorie: [1, 2],
//       subCategorie: [1],
//       quantity: 2,
//       dateCreate: DateTime.now()),
//   Product(
//       id: 2,
//       images: [
//         "assets/images/Image Popular Product 2.png",
//       ],
//       colors: [
//         'F6625E',
//         '836DB8',
//         'DECB9C',
//       ],
//       title: "Nike Sport White - Man Pant",
//       price: 50.5,
//       description: description,
//       isAnnonces: true,
//       marque: 'Nike',
//       categorie: [1, 2],
//       subCategorie: [1],
//       quantity: 2,
//       dateCreate: DateTime.now()),
//   Product(
//       id: 3,
//       images: [
//         "assets/images/glap.png",
//       ],
//       colors: [
//         'F6625E',
//         '836DB8',
//         'DECB9C',
//       ],
//       title: "Gloves XC Omega - Polygon",
//       price: 36.55,
//       description: description,
//       isFavourite: true,
//       isAnnonces: true,
//       marque: 'Nike',
//       categorie: [1, 2],
//       subCategorie: [1],
//       quantity: 2,
//       dateCreate: DateTime.now()),
//   Product(
//       id: 4,
//       images: [
//         "assets/images/wireless headset.png",
//       ],
//       colors: [
//         'F6625E',
//       ],
//       title: "Logitech Head",
//       price: 20.20,
//       description: description,
//       isFavourite: true,
//       marque: 'Nike',
//       categorie: [1, 2],
//       subCategorie: [1],
//       quantity: 1,
//       dateCreate: DateTime.now()),
// ];

// const String description =
//     "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
