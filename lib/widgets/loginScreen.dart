import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pashusevak/screens/loginOtpPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController MobilenumberController = TextEditingController();

  Future<void> generateLoginOTP() async {
    final apiUrl =
        'http://43.205.23.114/api/method/oymom.api.get_login_otp?mobile_no=${MobilenumberController.text}';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('---------------This is my output data $data');

        // Check if 'message' key is present and not null
        if (data != null && data['message'] != null) {
          String generatedOTP = extractOTPFromMessage(data['message']);

          // Pass mobile number and generated OTP to LoginOtpVerificationPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginOtpVerificationPage(
                  mobileNumber: MobilenumberController.text,
                  generatedOTP: generatedOTP,
                );
              },
            ),
          );
        } else {
          // Handle the case when 'message' is null or not present
          showErrorMessage(
              "Generated OTP is null or not present in the API response.");
        }
      } else {
        // Handle HTTP errors
        print('HTTP Error: ${response.statusCode}');
        print('API Response: ${response.body}');
        showErrorMessage("Failed to fetch OTP. Please try again.");
      }
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error during API call: $error');
      showErrorMessage("An error occurred. Please try again.");
    }
  }

  String extractOTPFromMessage(String fullMessage) {
    // Assuming the format is "OTP generated and sent successfully :094233"
    List<String> parts = fullMessage.split(':');
    if (parts.length == 2) {
      return parts[1].trim();
    } else {
      print('Error: Unexpected OTP message format');
      return '';
    }
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }

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
                controller: MobilenumberController,
                decoration: InputDecoration(
                  prefixText: "+91  ",
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
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
              print("mobile number entered: ${MobilenumberController.text}");
              generateLoginOTP();
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
