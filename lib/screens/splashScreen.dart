import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pashusevak/screens/FrontPage.dart';
import 'package:pashusevak/screens/carouselPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CarouselPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = 0.0;
            var end = 1.0;
            var curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 354,
                width: 354,
                decoration: BoxDecoration(
                  color: Color(0xffFFC09A),
                  borderRadius: BorderRadius.circular(170),
                ),
                child: Image.asset(
                    height: 209, width: 209, "assets/images/splashScreen.png")),
          )
        ],
      ),
    );
  }
}
