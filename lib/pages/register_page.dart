import 'package:flutter/material.dart';
import 'package:moneytap/components/my_button.dart';
import 'package:moneytap/components/my_textfield.dart';
import 'package:moneytap/components/square_tile.dart';
import 'package:moneytap/models/moneytap_user.dart';
import 'package:moneytap/pages/login_page.dart';
import 'package:moneytap/home_screen.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  //Function()? onTap;
  RegisterPage({
    super.key,
    /* required this.onTap*/
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedController = TextEditingController();
  final contactController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //sign user in method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 19, 104, 52),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),

                    //logo
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: Image.asset('assets/images/Moneytap2.png',
                          fit: BoxFit.fill),
                    ),

                    const SizedBox(height: 30),

                    //welcome back, you've been missed!
                    const Text(
                      "Let's create your account!",
                      style: TextStyle(
                        color: Color.fromARGB(255, 19, 104, 52),
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),

                    //user firstname
                    MyTextField(
                      validator: (value) {
                        return value!.isEmpty
                            ? "Please enter your contact name"
                            : null;
                      },
                      controller: contactController,
                      hintText: 'Contact Number',
                      obscureText: false,
                    ),

                    const SizedBox(height: 10),

                    //user textfield
                    MyTextField(
                      validator: (value) {
                        return value!.isEmpty
                            ? "Please enter your email name"
                            : null;
                      },
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),

                    const SizedBox(height: 10),

                    //password textfield
                    MyTextField(
                      validator: (value) {
                        return value!.isEmpty
                            ? "Please enter your email name"
                            : null;
                      },
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 10),

                    MyTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your confirmed password";
                        } else if (value != passwordController.text) {
                          return "Confirmed password does not match";
                        }
                        return null;
                      },
                      controller: confirmedController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 50),

                    //sign in button
                    MyButton(
                      text: 'sign up',
                      onTap: save,
                    ),

                    const SizedBox(height: 20),

                    //or continue with
                    /*Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: Colors.yellow[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    //google + apple sign in buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child:
                              SquareTile(imagePath: 'assets/images/google.png'),
                        ),
                        //google button

                        SizedBox(width: 25),

                        //apple button
                        SizedBox(
                          height: 80,
                          width: 80,
                          child:
                              SquareTile(imagePath: 'assets/images/apple.png'),
                        ),
                      ],
                    ),*/

                    const SizedBox(height: 50),

                    //not a member? register now
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('I have already an'),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      // ignore: prefer_const_constructors
                                      builder: (context) => LoginPage()));
                            },
                            child: const Text(
                              ' Account ',
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void save() {
    if (formKey.currentState!.validate()) {
      // if the form is valid, create a new Student object
      final newUser = UserMoneytap(
        email: emailController.text,
        password: passwordController.text,
        contact: confirmedController.text,
      );

      // TODO: Call the API to save the student data to the database
      final String url = 'http://10.0.2.2:8080/api/create_user';

      http.post(Uri.parse(url), body: {
        'email': newUser.email,
        'password': newUser.password,
        'contact': newUser.contact,
      }).then((response) {
        if (response.statusCode == 200) {
          // student data save successfully
          Navigator.pop(context);
        } else {
          // Error occured
          throw Exception('Failed to save data');
        }
      }).catchError((error) {
        // handle any errors
        print(error);
      });
      // show a snackbar to indicate success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('user data saved successfully!')),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
