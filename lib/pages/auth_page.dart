import 'package:flutter/material.dart';
import 'package:moneytap/home_screen.dart';
import 'package:moneytap/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* body:StreamBuilder<User?>(
        //authStatusChange
        stream:,
        builder: (context, snapshot) {
          //user is logged in
          if(snapshot.hasData){
            return HomeScreen();
          }
          //user is NOT Logged in
          else{
            return LoginPage();
          }
        }
        ),
      ) */
        );
  }
}
