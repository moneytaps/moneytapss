import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 6000,
          height: 6000,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Image.asset(
            'assets/images/boardingscreen3.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
