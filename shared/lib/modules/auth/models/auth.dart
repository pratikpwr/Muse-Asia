// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

class AuthModel {
  AuthModel({
    this.message,
    this.token,
    this.user,
  });

  String message;
  String token;
  User user;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        message: json["message"],
        token: json["token"],
        user: User.fromJson(json["user"]),
      );
}

class User {
  User({
    this.id,
    this.name,
    this.email,
  });

  String id;
  String name;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );
}

class AuthErrorModel {
  AuthErrorModel({
    this.statusCode,
    this.message,
    this.data,
  });

  int statusCode;
  String message;
  List<Datum> data;

  factory AuthErrorModel.fromJson(Map<String, dynamic> json) => AuthErrorModel(
    statusCode: json["statusCode"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );
}

class Datum {
  Datum({
    this.value,
    this.msg,
    this.param,
    this.location,
  });

  String value;
  String msg;
  String param;
  String location;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    value: json["value"],
    msg: json["msg"],
    param: json["param"],
    location: json["location"],
  );
}
