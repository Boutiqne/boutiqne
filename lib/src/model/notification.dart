// To parse this JSON data, do
//
//     final Notifcation = NotifcationFromJson(jsonString);

import 'dart:convert';

Notifcation notifcationFromJson(String str) =>
    Notifcation.fromJson(json.decode(str));

List<Notifcation> notifcationsListFromJson(String str) =>
    List<Notifcation>.from(
        json.decode(str).map((x) => Notifcation.fromJson(x)));

String notifcationToJson(Notifcation data) => json.encode(data.toJson());

// notification ToString
String notificationToString(List<Notifcation> notifications) =>
    json.encode(notifications.map((e) => e.toJson()).toList());

class Notifcation {
  Notifcation({this.created, this.title, this.message, this.id});
  String? id;
  String? title;
  int? created;
  String? message;

  factory Notifcation.fromJson(Map<Object?, dynamic> json) => Notifcation(
        created: json["created"],
        title: json["title"],
        message: json["message"],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        "created": created,
        "title": title,
        "message": message,
        'id': id,
      };
}
