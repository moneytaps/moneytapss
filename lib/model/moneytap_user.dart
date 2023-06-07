import 'package:flutter/cupertino.dart';

class UserMoneytap {

  String email;
  String password;
  String contact;
  String firstname;
  String middlename;
  String surname;

  UserMoneytap(
      {required this.email, required this.password, required this.contact,required this.firstname,
        required this.middlename,
        required this.surname,});

  factory UserMoneytap.fromJson(Map<String, dynamic> json) {
    return UserMoneytap(
      email: json['email'] == null ? '' : json['email'] as String,
      password: json['password'] == null ? '' : json['password'] as String,
      contact: json['contact'] == null ? '' : json['contact'] as String,
      firstname: json['firstname'] == null ? '' : json['firstname'] as String,
      middlename:
      json['middlename'] == null ? '' : json['middlename'] as String,
      surname: json['surname'] == null ? '' : json['surname'] as String,
    );
  }
}
