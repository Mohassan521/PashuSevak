import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pashusevak/Utils/localization.dart';
import 'package:pashusevak/provider/provider.dart';
import 'package:pashusevak/screens/roleSelection.dart';
import 'package:pashusevak/screens/splashScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LocalProvider()),
      ChangeNotifierProvider(create: (context) => DateProvider()),
      ChangeNotifierProvider(create: (context) => AppointmentsProvider())
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
        // home: RoleSelection(),
        // home: PashuSevakHomePage(),
        // home: DoctorHomePage(),
      );

      },);
  }
}
