import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pashusevak/screens/FrontPage.dart';
import 'package:pashusevak/screens/carouselPage.dart';
import 'package:pashusevak/screens/cattleFarmHome.dart';
import 'package:pashusevak/screens/doctorHome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sid = prefs.getString("sid");
    String? role = prefs.getString("role");
    print("role in splash screen:  $role");
    print("sid in splash screen:  $sid");
    if (sid != null) {
      if (role == "Doctor") {
        Timer(const Duration(seconds: 5), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DoctorHomePage(sid: sid)));
        });
      } else if (role == "Farmer") {
        Timer(const Duration(seconds: 5), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => CattleFarmHomePage(sid: sid)));
        });
      }
    } else {
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                CarouselPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image.asset("assets/images/splashScreen.png", width: MediaQuery.sizeOf(context).width * 0.55,)),
            
                Text("Welcome To Pashusevak", textAlign: TextAlign.center ,style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.orange),),
                
                Text("#gaow_ka_Nayak", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 18),),
                SizedBox(
                  height: 20,
                ),
                Center(child: Image.asset("assets/images/logo2.png", height: MediaQuery.sizeOf(context).height * 0.16,)),
                SizedBox(
                  height: 70,
                ),
                Text("#Supported & Incubated By", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 2),),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo1.png", width: MediaQuery.sizeOf(context).width * 0.15,),
                    SizedBox(
                      width: 22,
                    ),
                    Image.asset("assets/images/logo4.png", width: MediaQuery.sizeOf(context).width * 0.18,),
                    SizedBox(
                      width: 22,
                    ),
                    Image.asset("assets/images/logo5.jpeg", width: MediaQuery.sizeOf(context).width * 0.15,),
                  ],
                ),
                // SizedBox(
                //   height: MediaQuery.sizeOf(context).height * 0.1,
                // ),
                
              ],
            ),
            Column(
              children: [
                Text("#Copyright 2024", style: TextStyle(fontSize: 13, color: Colors.blue, fontWeight: FontWeight.bold, letterSpacing: 3.5),),
                Text("All Rights Reserved", style: TextStyle(fontSize: 13, color: Colors.blue, fontWeight: FontWeight.bold, letterSpacing: 3.5))
              ],
            )
          ],
        ),
      )
    );
  }
}
