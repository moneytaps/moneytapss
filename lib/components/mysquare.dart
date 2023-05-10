import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  final String image;
  const MySquare({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
      ),
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
