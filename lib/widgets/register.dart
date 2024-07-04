import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Sign Up',
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
              labelText: 'Full Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
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
          SizedBox(
            height: 15,
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
            child: Text("Register"),
            minWidth: double.infinity,
            textColor: Colors.white,
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
                    borderRadius: BorderRadius.circular(7.5))),
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
                    minimumSize: Size(150, 50), // Adjust button size
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5))),
                icon: FaIcon(FontAwesomeIcons.google),
                label: Text('Google', style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    // primary: Colors.white,
                    side: BorderSide(color: Colors.grey), // Border color
                    minimumSize: Size(150, 50), // Adjust button size
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.5))),
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                ),
                label: Text('Facebook', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
