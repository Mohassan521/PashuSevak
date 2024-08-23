import 'package:flutter/material.dart';
import 'package:pashusevak/provider/provider.dart';
import 'package:pashusevak/screens/FrontPage.dart';
import 'package:pashusevak/widgets/loginScreen.dart';
import 'package:provider/provider.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {

  


  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocalProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Select Language",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () {
                    localeProvider.setLocale(const Locale('en', 'US'));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FrontPage()));
                  },
                  child: Center(child: Text("English")),
                  color: Colors.white,
                  padding: EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.orange,
                      width: 1.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    localeProvider.setLocale(const Locale('hi', 'IN'));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FrontPage()));
                  },
                  child: Center(child: Text("Hindi")),
                  color: Colors.white,
                  padding: EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.orange,
                      width: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
