import 'package:flutter/cupertino.dart';

class ClientMoneytap {
  String firstName;
  String middleName;
  String surName;
  String birth;
  String gender;
  String address;
  int days;
  String primary;
  double loanAmount;
  double interest;
  double totalAmount;
  String purpose;

  ClientMoneytap({
    required this.firstName,
    required this.middleName,
    required this.surName,
    required this.birth,
    required this.gender,
    required this.address,
    required this.loanAmount,
    required this.days,
    required this.primary,
    required this.interest,
    required this.totalAmount,
    required this.purpose,
  });

  factory ClientMoneytap.fromJson(Map<String, dynamic> json) {
    return ClientMoneytap(
      firstName: json['firstName'] == null ? '' : json['firstName'] as String,
      middleName:
          json['middleName'] == null ? '' : json['middleName'] as String,
      surName: json['surName'] == null ? '' : json['surName'] as String,
      birth: json['birth'] == null ? 0 : json['birth'].String,
      gender: json['gender'] == null ? '' : json['gender'] as String,
      address: json['address'] == null ? '' : json['address'] as String,
      primary: json['primary'] == null ? '' : json['primary'] as String,
      loanAmount: json['loanAmount'] == null
          ? 0.0
          : double.parse(json['loanAmount'].toString()),
      days: json['days'] == null ? 0 : int.parse(json['days'].toString()),
      totalAmount: json['totalAmount'] == null
          ? 0.0
          : double.parse(json['totalAmount'].toString()),
      purpose: json['purpose'] == null ? '' : json['purpose'] as String,
      interest: json['interest'] == null
          ? 0.0
          : double.parse(json['interest'].toString()),
    );
  }
}
