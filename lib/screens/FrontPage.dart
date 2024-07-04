import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pashusevak/widgets/loginScreen.dart';
import 'package:pashusevak/widgets/register.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.orange.shade900,
          //     Colors.orange.shade800,
          //     Colors.orange.shade400,
          //   ],
          // ),
          image: DecorationImage(
            image: AssetImage("assets/images/cow.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.19,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          tabs: [
                            Tab(text: 'Sign In'),
                            Tab(text: 'Sign Up'),
                          ],
                          labelColor: Colors.black,
                          labelStyle: TextStyle(fontSize: 17.5),
                          indicatorColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.tab,
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              LoginPage(),
                              RegisterPage()
                              // SignInForm(),
                              // SignUpForm(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
