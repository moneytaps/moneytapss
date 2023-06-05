class Clientlist {
  int? id;
  int? status;
  String? contact;
  String? firstName;
  String? middleName;
  String? surName;
  int? loanAmount;
  int? days;
  int? interest;
  int? totalAmount;


  Clientlist(
      {this.id,
        this.status,
        this.contact,
      this.firstName,
      this.middleName,
      this.surName,
      this.loanAmount,
      this.days,
      this.interest,
      this.totalAmount,
    });

  Clientlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    contact= json['contact'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    surName = json['sur_name'];
    loanAmount = json['loan_amount'];
    days = json['days'];
    interest = json['interest'];
    totalAmount = json['total_amount'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['contact'] = this.contact;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['sur_name'] = this.surName;
    data['loan_amount'] = this.loanAmount;
    data['days'] = this.days;
    data['interest'] = this.interest;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}
