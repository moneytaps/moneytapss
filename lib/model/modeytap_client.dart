import 'package:flutter/cupertino.dart';

class ClientMoneytap {
  String contact;
  String first_name;
  String middle_name;
  String sur_name;
  String birth;
  String gender;
  String address;
  int days;
  String primary;
  double loan_amount;
  double interest;
  double total_amount;
  String purpose;

  ClientMoneytap({
    required this.contact,
    required this.first_name,
    required this.middle_name,
    required this.sur_name,
    required this.birth,
    required this.gender,
    required this.address,
    required this.loan_amount,
    required this.days,
    required this.primary,
    required this.interest,
    required this.total_amount,
    required this.purpose,
  });

  factory ClientMoneytap.fromJson(Map<String, dynamic> json) {
    return ClientMoneytap(
      contact: json['contact'] == null ? '' : json['contact'] as String,
      first_name: json['first_name'] == null ? '' : json['first_name'] as String,
      middle_name:
          json['middle_name'] == null ? '' : json['middle_name'] as String,
      sur_name: json['sur_name'] == null ? '' : json['sur_name'] as String,
      birth: json['birth'] == null ? 0 : json['birth'].String,
      gender: json['gender'] == null ? '' : json['gender'] as String,
      address: json['address'] == null ? '' : json['address'] as String,
      primary: json['primary'] == null ? '' : json['primary'] as String,
      loan_amount: json['loan_amount'] == null
          ? 0.0
          : double.parse(json['loan_amount'].toString()),
      days: json['days'] == null ? 0 : int.parse(json['days'].toString()),
      total_amount: json['total_amount'] == null
          ? 0.0
          : double.parse(json['total_amount'].toString()),
      purpose: json['purpose'] == null ? '' : json['purpose'] as String,
      interest: json['interest'] == null
          ? 0.0
          : double.parse(json['interest'].toString()),
    );
  }
}
