import 'package:flutter/material.dart';
import 'package:moneytap/components/my_button.dart';
import 'package:moneytap/components/my_textfield.dart';
import 'package:moneytap/components/square_tile.dart';
import 'package:moneytap/home_screen.dart';
import 'package:moneytap/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  //Function()? onTap;
  LoginPage({
    super.key,
    /*required this.onTap*/
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

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
                    const SizedBox(height: 50),

                    //logo
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset('assets/images/Moneytap2.png',
                          fit: BoxFit.fill),
                    ),

                    SizedBox(height: 40),

                    //welcome back, you've been missed!
                    const Text(
                      ' Welcome back!',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),

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

                    //forgot password?
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
                    ),

                    const SizedBox(height: 40),

                    //sign in button
                    MyButton(
                      text: 'sign in',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {}
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                    ),

                    const SizedBox(height: 20),

                    //or continue with
                    Padding(
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
                              style: TextStyle(color: Colors.yellow),
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
                    ),
                    const SizedBox(height: 50),

                    //not a member? register now
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
                                    builder: (context) => RegisterPage()));
                          },
                          // widget.onTap,
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
