import 'package:flutter/material.dart';
import 'package:moneytap/model/modeytap_client.dart';
import 'package:moneytap/pages/homepages/barrowpages/confirm_user.dart';

class UserBarrow extends StatefulWidget {
  const UserBarrow({super.key});

  @override
  State<UserBarrow> createState() => _UserBarrowState();
}

class _UserBarrowState extends State<UserBarrow> {
  var first_name;
  var middle_name;
  var sur_name;
  var birth;
  var gender;
  var address;
  var primary;
  var loan_amount;
  var days;
  var purpose;
  var interest;
  var total_amount;
  var contact;
  final contactController = TextEditingController();
  final total_amountController = TextEditingController();
  final interestController = TextEditingController();
  final purposeController = TextEditingController();
  final primaryController = TextEditingController();
  final daysController = TextEditingController();
  final loan_amountController = TextEditingController();
  final first_nameController = TextEditingController();
  final middle_nameController = TextEditingController();
  final sur_nameController = TextEditingController();
  final birthController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    contactController.addListener(_updateText);
    total_amountController.addListener(_updateText);
    interestController.addListener(_updateText);
    purposeController.addListener(_updateText);
    daysController.addListener(_updateText);
    loan_amountController.addListener(_updateText);
    primaryController.addListener(_updateText);
    first_nameController.addListener(_updateText);
    middle_nameController.addListener(_updateText);
    sur_nameController.addListener(_updateText);
    birthController.addListener(_updateText);
    genderController.addListener(_updateText);
    addressController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      contact = contactController.text;
      total_amount = total_amountController.text;
      interest = interestController.text;
      purpose = purposeController.text;
      days = daysController.text;
      loan_amount = loan_amountController.text;
      primary = primaryController.text;
      first_name = first_nameController.text;
      middle_name = middle_nameController.text;
      sur_name = sur_nameController.text;
      birth = birthController.text;
      gender = genderController.text;
      address = addressController.text;
      if (days != null && loan_amount != null) {
        double? parsedDays = double.tryParse(days!);
        double? parsedLoanAmount = double.tryParse(loan_amount!);
        if (parsedDays != null && parsedLoanAmount != null) {
          double interestValue = parsedDays * parsedLoanAmount * 0.0006;
          interestController.text = interestValue.toStringAsFixed(2);
          double totalAmount = interestValue + parsedLoanAmount;
          total_amountController.text = totalAmount.toStringAsFixed(2);
        }
      }
    });
  }

  void checkLoanAmount() {
    if (loan_amount.isNotEmpty) {
      int loanAmount = int.tryParse(loan_amount) ?? 0;
      if (loanAmount > 25000) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Warning'),
              content: Text(
                  'Loan amount exceeds 25,000. Please select a different amount.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Loan Form'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 19, 104, 52),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [TextFormField(
            validator: (value) {
              return value!.isEmpty ? "Please enter your phone number " : null;
            },
            controller: contactController,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              labelText: 'Phone number',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
            ),
          ),
            Text("Your legal Firstname is ${contactController.text}  "),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? "Please enter your Phone number" : null;
              },
              controller: first_nameController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'First name',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
              ),
            ),
            Text("Your legal Firstname is ${first_nameController.text}  "),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? "Please enter your middle name" : null;
              },
              controller: middle_nameController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'middle name',
                border: OutlineInputBorder(),
              ),
            ),
            Text("Your legal middlename is ${middle_nameController.text}  "),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? "Please enter your surname" : null;
              },
              controller: sur_nameController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Surname',
                border: OutlineInputBorder(),
              ),
            ),
            Text("Your legal Surname is ${sur_nameController.text}  "),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? "Please enter your Birthday" : null;
              },
              controller: birthController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Date/Month/Year',
                border: OutlineInputBorder(),
              ),
            ),
            Text("Your legal Birth date is ${birthController.text}  "),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? "Please enter your gender" : null;
              },
              controller: genderController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Male/female',
                border: OutlineInputBorder(),
              ),
            ),
            Text("Your Gender is ${genderController.text}  "),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? "Please enter your Address" : null;
              },
              controller: addressController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Loan Imformation?',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'what is your Source of Income',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                return value!.isEmpty
                    ? "Please enter your Primary source"
                    : null;
              },
              controller: primaryController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Scource Income',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'How much Loan Amount do you want? (Reminder: Maximum of 25k)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (checkLoanAmount) {
                return checkLoanAmount!.isEmpty ? "Please enter your loan amount" : null;
              },
              controller: loan_amountController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Loan Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'How long you want to pay?',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: daysController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Reminder: Maximum of 90days',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'What is your loan purpose',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: purposeController,
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: "Purpose",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 50),
            myFbtn(context),
          ],
        ),
      ),
    );
  }

  OutlinedButton myFbtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(200, 50),
        backgroundColor: Colors.yellow,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ConfirmUser(
                contact: contactController.text,
                first_name: first_nameController.text,
                middle_name: middle_nameController.text,
                sur_name: sur_nameController.text,
                birth: birthController.text,
                gender: genderController.text,
                primary: primaryController.text,
                address: addressController.text,
                loan_amount: loan_amountController.text,
                days: daysController.text,
                purpose: purposeController.text,
                total_amount: total_amountController.text,
                interest: interestController.text,
              );
            },
          ),
        );
      },
      child: Text(
        'Confirm'.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
