import 'package:flutter/material.dart';
import 'package:moneytap/model/modeytap_client.dart';
import 'package:moneytap/pages/homepages/barrowpages/confirm_user.dart';

class UserBarrow extends StatefulWidget {
  const UserBarrow({super.key});

  @override
  State<UserBarrow> createState() => _UserBarrowState();
}

class _UserBarrowState extends State<UserBarrow> {
  var _firstName;
  var _middleName;
  var _surName;
  var _birth;
  var _gender;
  var _address;
  var _primary;
  var _loanAmount;
  var _days;
  var _purpose;
  var _interest;
  var _totalAmount;
  var _contact;
  final _contactController = TextEditingController();
  final _totalAmountController = TextEditingController();
  final _interestController = TextEditingController();
  final _purposeController = TextEditingController();
  final _primaryController = TextEditingController();
  final _daysController = TextEditingController();
  final _loanAmountController = TextEditingController();
  final _firstController = TextEditingController();
  final _middleController = TextEditingController();
  final _surController = TextEditingController();
  final _birthController = TextEditingController();
  final _genderController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _contactController.addListener(_updateText);
    _totalAmountController.addListener(_updateText);
    _interestController.addListener(_updateText);
    _purposeController.addListener(_updateText);
    _daysController.addListener(_updateText);
    _loanAmountController.addListener(_updateText);
    _primaryController.addListener(_updateText);
    _firstController.addListener(_updateText);
    _middleController.addListener(_updateText);
    _surController.addListener(_updateText);
    _birthController.addListener(_updateText);
    _genderController.addListener(_updateText);
    _addressController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _contact =_contactController.text;
      _totalAmount = _totalAmountController.text;
      _interest = _interestController.text;
      _purpose = _purposeController.text;
      _days = _daysController.text;
      _loanAmount = _loanAmountController.text;
      _primary = _primaryController.text;
      _firstName = _firstController.text;
      _middleName = _middleController.text;
      _surName = _surController.text;
      _birth = _birthController.text;
      _gender = _genderController.text;
      _address = _addressController.text;
      if (_days != null && _loanAmount != null) {
        var days = double.tryParse(_days);
        var loanAmount = double.tryParse(_loanAmount);
        if (days != null && loanAmount != null) {
          var interest = days * loanAmount * 0.0006;
          _interestController.text = interest.toStringAsFixed(2);
          var totalAmount = interest + loanAmount;
          _totalAmountController.text = totalAmount.toStringAsFixed(2);
        }
      }
    });
  }

  void checkLoanAmount() {
    if (_loanAmount.isNotEmpty) {
      int loanAmount = int.tryParse(_loanAmount) ?? 0;
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
            controller: _contactController,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              labelText: 'Phone number',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
            ),
          ),
            Text("Your legal Firstname is ${_contactController.text}  "),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? "Please enter your Phone number" : null;
              },
              controller: _firstController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'First name',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
              ),
            ),
            Text("Your legal Firstname is ${_firstController.text}  "),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? "Please enter your middle name" : null;
              },
              controller: _middleController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'middle name',
                border: OutlineInputBorder(),
              ),
            ),
            Text("Your legal middlename is ${_middleController.text}  "),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? "Please enter your surname" : null;
              },
              controller: _surController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Surname',
                border: OutlineInputBorder(),
              ),
            ),
            Text("Your legal Surname is ${_surController.text}  "),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? "Please enter your Birthday" : null;
              },
              controller: _birthController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Date/Month/Year',
                border: OutlineInputBorder(),
              ),
            ),
            Text("Your legal Birth date is ${_birthController.text}  "),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? "Please enter your gender" : null;
              },
              controller: _genderController,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Male/female',
                border: OutlineInputBorder(),
              ),
            ),
            Text("Your Gender is ${_genderController.text}  "),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                return value!.isEmpty ? "Please enter your Address" : null;
              },
              controller: _addressController,
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
              controller: _primaryController,
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
              validator: (value) {
                return value!.isEmpty ? "Please enter your loan amount" : null;
              },
              controller: _loanAmountController,
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
              controller: _daysController,
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
              controller: _purposeController,
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
                contact: _contactController.text,
                firstName: _firstController.text,
                middleName: _middleController.text,
                surName: _surController.text,
                birth: _birthController.text,
                gender: _genderController.text,
                primary: _primaryController.text,
                address: _addressController.text,
                loanAmount: _loanAmountController.text,
                days: _daysController.text,
                purpose: _purposeController.text,
                totalAmount: _totalAmountController.text,
                interest: _interestController.text,
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
