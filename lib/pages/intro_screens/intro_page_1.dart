import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

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
            'assets/images/boardingscreen1.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
    // return Container(
    //   height: 120,
    //   width: 120,
    //   decoration: const BoxDecoration(
    //     image: DecorationImage(
    //       fit: BoxFit.fitHeight,
    //       image: AssetImage(
    //         'assets/images/boardingscreen1.png ',
    //       ),
    //     ),
    //   ),
    //   //color: Colors.green,
    //   //child: Center(child: Text("Yooooooooooo Page 2")),

    //   /*body: SafeArea(
    //       child: Image.asset('assets/images/boardingscreeen1', fit: BoxFit.fill),
    //     ),*/
    // );
  }
}
