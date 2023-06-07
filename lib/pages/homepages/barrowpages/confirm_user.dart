import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneytap/home_screen.dart';
import 'package:moneytap/model/modeytap_client.dart';

import '../../../components/my_button.dart';
import 'package:http/http.dart' as http;
class ConfirmUser extends StatefulWidget {
  ConfirmUser(
      {Key? key,
      required this.first_name,
      required this.middle_name,
      required this.sur_name,
      required this.birth,
      required this.gender,
      required this.address,
      required this.primary,
      required this.loan_amount,
      required this.purpose,
      required this.interest,
      required this.total_amount,
        required this.contact,
      required this.days})
      : super(key: key);
  String first_name,
      contact,
      middle_name,
      sur_name,
      birth,
      gender,
      address,
      primary,
      loan_amount,
      purpose,
      interest,
      total_amount,
      days;

  @override
  State<ConfirmUser> createState() => _ConfirmUserState();
}



bool? _chechBox = false;

class _ConfirmUserState extends State<ConfirmUser> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 19, 104, 52),
        title: Text('Review your Answers'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Container(
            child: ListView(
              children: [
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Contact number:  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${widget.contact}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "First name:  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${widget.first_name}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Middle name:  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${widget.middle_name}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Surname:  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${widget.sur_name}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Birthdate:  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${widget.birth}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gender:  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${widget.gender}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Address:  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${widget.address}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Source of Income:  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${widget.primary}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Loan Amount:  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "₱ ${widget.loan_amount}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Loan Days:  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${widget.days}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "interest:  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${widget.interest}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Paying Amount:  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "₱${widget.total_amount}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Purpose:\n" " ${widget.purpose}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        value: _chechBox,
                        onChanged: (val) {
                          setState(() {
                            _chechBox = val;
                          });
                        }),
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 10),
                                        Text(
                                          "Terms and Conditions\n\n\n"
                                          "Introduction\n\n"
                                          "These terms and conditions (“Terms”) govern your use of the services provided by our company (“Company”). By using our services, you agree to be bound by these Terms.\n\n"
                                          "Description of Services\n\n"
                                          "The Company provides financial services including loans and other financial products to individuals and businesses. By using our services you acknowledge that you have read and understood the terms and conditions associated with these products.\n\n"
                                          "Eligibility\n\n"
                                          "In order to use our services, you must be at least 18 years of age and a resident of the Philippines. By using our services, you represent and warrant that you meet these eligibility requirements.\n\n"
                                          "User Account\n\n"
                                          "In order to use our services, you may be required to create a user account. You agree to provide accurate and complete information when creating your account and to keep your account information up to date. You are responsible for maintaining the confidentiality of your account login credentials and for all activities that occur under your account.\n\n"
                                          "Use of Services\n\n"
                                          "By using our services, you agree to comply with all applicable laws and regulations. You agree not to use our services for any illegal or unauthorized purpose, and to comply with all applicable laws and regulations related to your use of our services.\n\n"
                                          "Intellectual Property\n\n"
                                          "All content and materials provided through our services, including but not limited to logos, text, graphics, and images, are owned or licensed by the Company and are protected by copyright, trademark, and other intellectual property laws. You may not use or reproduce any of this content or materials without our express written consent.\n\n"
                                          "Disclaimer of Warranties\n\n"
                                          "The Company makes no representations or warranties, express or implied, with respect to the accuracy or completeness of any information provided through our services. The Company shall not be liable for any errors or omissions in the information provided through our services, or for any damages arising from the use of our services.\n\n"
                                          "Limitation of Liability\n\n"
                                          "The Company shall not be liable for any direct indirect incidental special or consequential damages arising from the use of our services including but not limited to damages for loss of profits, goodwill, use, data or other intangible losses, even if the Company has been advised of the possibility of such damages.\n\n"
                                          "Indemnification\n\n"
                                          "You agree to indemnify and hold the Company and its affiliates, officers directors employees agents and licensors harmless from any claim demand or damages including reasonable attorneys fees, arising out of your use of our services, your violation of these Terms, or your violation of any rights of another.\n\n"
                                          "Modification of Terms\n\n"
                                          "The Company reserves the right to modify these Terms at any time without prior notice. Your continued use of our services following any such modifications constitutes your acceptance of the modified Terms.\n\n"
                                          "Termination\n\n"
                                          "The Company reserves the right to terminate your access to our services at any time, with or without cause, and with or without notice.\n\n"
                                          "Entire Agreement\n\n"
                                          "These Terms constitute the entire agreement between you and the Company with respect to your use of our services and supersede all prior or contemporaneous communications and proposals, whether oral or written, between you and the Company.\n\n"
                                          "Contact Information\n\n"
                                          "If you have any questions about these Terms or our services please contact us at contact information.\n\n",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Text('Terms & Conditions')),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                MyButton(
                  text: 'confirm',
                  onTap: () {
                    clientsave(formKey);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clientsave(formKey) async {
    if (formKey.currentState!.validate()) {
      // if the form is valid, create a new Student object

      /*final newClient = ClientMoneytap(
        contact: widget.contact,
        first_name: widget.first_name,
        middle_name: widget.middle_name,
        sur_name: widget.sur_name,
        birth: widget.birth,
        gender: widget.gender,
        primary: widget.address,
        address: widget.primary,
        loan_amount: double.parse(widget.loan_amount.toString()),
        days: int.parse(widget.days),
        purpose: widget.purpose,
        total_amount: double.parse(widget.total_amount.toString()),
        interest: double.parse(widget.interest.toString()),
      );*/

      // TODO: Call the API to save the student data to the database
      const String url = 'http://10.0.2.2:8080/api/create_loan';

      http.Response response = await http.post(Uri.parse(url),

          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
        'contact':  widget.contact,
        'first_name': widget.first_name  ,
        'middle_name':widget.middle_name,
        'sur_name': widget.sur_name,
        'birth': widget.birth,
        'gender': widget.gender,
        'primary':widget.primary,
        'address': widget.address,
        'days': widget.days,
        'loan_amount': double.parse(widget.loan_amount),
        'total_amount': double.parse(widget.total_amount),
        'purpose': widget.purpose,
        'interest': double.parse(widget.interest),
      }));
      print(response.statusCode);
      print(response.body);

      /*http.post(Uri.parse(url), body: <String, dynamic>{
        'contact':  widget.contact,
        'first_name': widget.first_name,
        'middle_name':widget.middle_name,
        'sur_name': widget.sur_name,
        'birth': widget.birth,
        'gender':  widget.gender,
        'primary': widget.primary,
        'address': widget.address,
        'days': int.parse(widget.days.toString()),
        'loan_amount': double.parse(widget.loan_amount.toString()),
        'total_amount': double.parse(widget.total_amount.toString()),
        'purpose': widget.purpose,
        'interest': double.parse(widget.interest.toString()),
      }).then((response) {
        if (response.statusCode == 200) {
          // student data save successfully
          Navigator.pop(context);
        } else {
          // Error occured
          throw Exception('Failed to save data');
        }
      }).catchError((error) {
        print('hey');
        // handle any errors
        print(error);
      });*/
      // show a snackbar to indicate success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
          content: Center(
            heightFactor:20.0,
            widthFactor: 15.0,
            child: Text(
              'Client data saved successfully!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
    }
  }
}
