import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pashusevak/firebase_options.dart';
import 'package:pashusevak/screens/FrontPage.dart';
import 'package:pashusevak/screens/PashuSevakScreens/LivestockDetails.dart';
import 'package:pashusevak/screens/PashuSevakScreens/basicDetails.dart';
import 'package:pashusevak/screens/PashuSevakScreens/cattleDetails.dart';
import 'package:pashusevak/screens/PashuSevakScreens/profileAndSettings.dart';
import 'package:pashusevak/screens/appointmentDetails.dart';
import 'package:pashusevak/screens/carouselPage.dart';
import 'package:pashusevak/screens/cattleDetails.dart';
import 'package:pashusevak/screens/cattleFarmHome.dart';
import 'package:pashusevak/screens/doctorHome.dart';
import 'package:pashusevak/screens/emergencyAppointment.dart';
import 'package:pashusevak/screens/prescriptionAndReport.dart';
import 'package:pashusevak/screens/selectLanguage.dart';
import 'package:pashusevak/screens/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
