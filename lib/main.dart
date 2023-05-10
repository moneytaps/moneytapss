import 'package:flutter/material.dart';
import 'package:moneytap/onbording_screen.dart';
import 'package:moneytap/pages/admin/admin_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
