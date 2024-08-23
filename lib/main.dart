import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pashusevak/Utils/localization.dart';
import 'package:pashusevak/provider/provider.dart';
import 'package:pashusevak/screens/FrontPage.dart';
import 'package:pashusevak/screens/PashuSevakScreens/LivestockDetails.dart';
import 'package:pashusevak/screens/PashuSevakScreens/basicDetails.dart';
import 'package:pashusevak/screens/PashuSevakScreens/cattleDetails.dart';
import 'package:pashusevak/screens/PashuSevakScreens/homeScreen.dart';
import 'package:pashusevak/screens/PashuSevakScreens/profileAndSettings.dart';
import 'package:pashusevak/screens/appointmentDetails.dart';
import 'package:pashusevak/screens/carouselPage.dart';
import 'package:pashusevak/screens/cattleDetails.dart';
import 'package:pashusevak/screens/cattleFarmHome.dart';
import 'package:pashusevak/screens/doctorHome.dart';
import 'package:pashusevak/screens/doctorsListForEmergencyCare.dart';
import 'package:pashusevak/screens/prescriptionAndReport.dart';
import 'package:pashusevak/screens/selectLanguage.dart';
import 'package:pashusevak/screens/splashScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LocalProvider()),
      ChangeNotifierProvider(create: (context) => DateProvider()),
      
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<LocalProvider>(
      builder: (context, value, child) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        localizationsDelegates: [
          Localization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('hi', 'IN'),
        ],
        locale: value.locale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
        // home: DoctorsListForEmergencyCare(),
        // home: PashuSevakHomePage(),
        // home: DoctorHomePage(),
      );

      },);
  }
}
