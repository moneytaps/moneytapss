import 'package:flutter/material.dart';
import 'package:moneytap/pages/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'pages/intro_screens/intro_page_1.dart';
import 'pages/intro_screens/intro_page_2.dart';
import 'pages/intro_screens/intro_page_3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  // keep track of it we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //pageview
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          Container(
            alignment: const Alignment(0, 0.90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                      ),
                      child: const Text(
                        "Skip",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),

                onLastPage
                    //?TextButton(buil)
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow,
                            shape: BoxShape.rectangle,
                          ),
                          child: const Text(
                            "Let's started",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                            ),
                            child: const Text(
                              "next",
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
