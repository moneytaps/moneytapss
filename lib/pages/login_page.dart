import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moneytap/components/my_button.dart';
import 'package:moneytap/components/my_textfield.dart';

import 'package:moneytap/home_screen.dart';
import 'package:moneytap/pages/admin/admin_home_screen.dart';
import 'package:moneytap/pages/register_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  Future<void> _login(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email == "Admin@" && password == "Admin123") {
      // Navigate to admin dashboard
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
          (route) => false);
    } else {
      try {
        final response = await http.post(
          Uri.parse('http://10.0.2.2:8080/api/user/login'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          // Navigate to regular user home screen
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);
        } else {
          final responseBody = jsonDecode(response.body);
          setState(() {
            errorMessage = responseBody['message'];
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Login Failed'),
                content: Text(errorMessage),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('An error occurred. Please try again later.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

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
                  const SizedBox(height: 40),
                  MyButton(
                    text: 'Sign In',
                    onTap: () => _login(context),
                  ),
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
