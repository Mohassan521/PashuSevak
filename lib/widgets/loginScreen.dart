import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          SizedBox(height: 25),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email Address',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.visibility_off),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Forgot Password?'),
              ),
            ],
          ),
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //     // primary: Colors.orange,
          //     minimumSize: Size(double.infinity, 50), // Full-width button
          //   ),
          //   child: Text('Log In'),
          // ),
          MaterialButton(
            onPressed: () {},
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
          SizedBox(height: 28),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                // primary: Colors.black,
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(7.5)) // Full-width button
                ),
            icon: FaIcon(
              FontAwesomeIcons.apple,
              color: Colors.white,
            ),
            label: Text(
              'Continue with Apple',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    // primary: Colors.white,
                    side: BorderSide(color: Colors.grey), // Border color
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(7.5)) // Adjust button size
                    ),
                icon: FaIcon(FontAwesomeIcons.google),
                label: Text('Google', style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.grey),
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5),
                  ), // Adjust button size
                ),
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                ),
                label: Text(
                  'Facebook',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
