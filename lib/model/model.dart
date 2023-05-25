class Clientlist {
  int? id;
  String? firstName;
  String? middleName;
  String? surName;
  String? birth;
  String? gender;
  String? address;
  String? primary;
  int? loanAmount;
  int? days;
  int? interest;
  int? totalAmount;
  String? purpose;

  Clientlist(
      {this.id,
      this.firstName,
      this.middleName,
      this.surName,
      this.birth,
      this.gender,
      this.address,
      this.primary,
      this.loanAmount,
      this.days,
      this.interest,
      this.totalAmount,
      this.purpose});

  Clientlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    surName = json['sur_name'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    primary = json['primary'];
    loanAmount = json['loan_amount'];
    days = json['days'];
    interest = json['interest'];
    totalAmount = json['total_amount'];
    purpose = json['purpose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['sur_name'] = this.surName;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['primary'] = this.primary;
    data['loan_amount'] = this.loanAmount;
    data['days'] = this.days;
    data['interest'] = this.interest;
    data['total_amount'] = this.totalAmount;
    data['purpose'] = this.purpose;
    return data;
  }
}
