import 'package:flutter/cupertino.dart';

class UserMoneytap {

  String email;
  String password;
  String contact;
  String firstName;
  String middleName;
  String surName;

  UserMoneytap(
      {required this.email, required this.password, required this.contact,required this.firstName,
        required this.middleName,
        required this.surName,});

  factory UserMoneytap.fromJson(Map<String, dynamic> json) {
    return UserMoneytap(
      email: json['email'] == null ? '' : json['email'] as String,
      password: json['password'] == null ? '' : json['password'] as String,
      contact: json['contact'] == null ? '' : json['contact'] as String,
      firstName: json['firstName'] == null ? '' : json['firstName'] as String,
      middleName:
      json['middleName'] == null ? '' : json['middleName'] as String,
      surName: json['surName'] == null ? '' : json['surName'] as String,
    );
  }
}
