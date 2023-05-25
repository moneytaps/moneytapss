import 'package:flutter/cupertino.dart';

class UserMoneytap {
  String email;
  String password;
  String contact;

  UserMoneytap(
      {required this.email, required this.password, required this.contact});

  factory UserMoneytap.fromJson(Map<String, dynamic> json) {
    return UserMoneytap(
      email: json['email'] == null ? '' : json['email'] as String,
      password: json['password'] == null ? '' : json['password'] as String,
      contact: json['contact'] == null ? '' : json['contact'] as String,
    );
  }
}
