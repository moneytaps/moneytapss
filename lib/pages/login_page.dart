import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:moneytap/components/my_button.dart';
import 'package:moneytap/components/my_textfield.dart';
import 'package:moneytap/components/square_tile.dart';
import 'package:moneytap/home_screen.dart';
import 'package:moneytap/pages/register_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Image.asset('assets/images/Moneytap2.png',
                        fit: BoxFit.fill),
                  ),
                  SizedBox(height: 40),
                  const Text(
                    ' Welcome back!',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
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
                  /* const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot the Password?',
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ],
                    ),
                  ),*/
                  const SizedBox(height: 40),
                  MyButton(
                    text: 'sign in',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        final email = emailController.text;
                        final password = passwordController.text;

                        final url = Uri.parse('http://10.0.2.2:8080/api/login');
                        try {
                          final response = await http.post(
                            url,
                            body: {
                              'email': email,
                              'password': password,
                            },
                          );

                          if (response.statusCode == 200) {
                            final data = jsonDecode(response.body);
                            final bool loggedIn = data['loggedIn'] ?? false;

                            if (loggedIn) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Login Failed'),
                                  content: Text('Invalid email or password.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content:
                                    Text('Failed to connect to the server.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        } catch (error) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text('An error occurred: $error'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                  ),

                  /* MyButton(
                    text: 'sign in',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        final email = emailController.text;
                        final password = passwordController.text;

                        final url = Uri.parse('http://10.0.2.2:8080/api/login');
                        final response = await http.post(
                          url,
                          body: {
                            'email': email,
                            'password': password,
                          },
                        );

                        if (response.statusCode == 200) {
                          final data = jsonDecode(response.body);
                          final bool loggedIn = data['loggedIn'] ?? false;

                          if (loggedIn) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Login Failed'),
                                content: Text('Invalid email or password.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text('Failed to connect to the server.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                  ),*/
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member?'),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
