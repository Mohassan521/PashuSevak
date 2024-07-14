import 'package:flutter/material.dart';
import 'package:pashusevak/screens/FrontPage.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
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
                  onPressed: () {},
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
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FrontPage()));
              },
              child: Center(child: Text("Continue")),
              color: Colors.orange,
              textColor: Colors.white,
              padding: EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ],
        ),
      ),
    );
  }
}
