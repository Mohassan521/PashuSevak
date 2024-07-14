import 'package:flutter/material.dart';
import 'package:pashusevak/screens/doctorHome.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Sign In',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 10),
              Text(
                'Sign in to get community based Veterinary care service provider.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {},
              //   style: ElevatedButton.styleFrom(
              //     // primary: Colors.orange,
              //     minimumSize: Size(double.infinity, 50), // Full-width button
              //   ),
              //   child: Text('Log In'),
              // ),
            ],
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorHomePage(),
                ),
              );
            },
            child: Text(
              "Log In",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            minWidth: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 11),
            textColor: Colors.black,
            color: Color(0xfff89255),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ],
      ),
    );
  }
}
