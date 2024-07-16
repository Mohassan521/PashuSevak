import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pashusevak/screens/cattleFarmHome.dart';
import 'package:pashusevak/screens/doctorHome.dart';
import 'package:pashusevak/widgets/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpManagerr {
  static String generatedOTP = '';
  static String mobileNumber = '';
  static Map<String, String> cookieHeader1 = {};
}

class LoginOtpVerificationPage extends StatefulWidget {
  final String mobileNumber;
  final String generatedOTP;

  LoginOtpVerificationPage({
    required this.mobileNumber,
    required this.generatedOTP,
  });

  @override
  _LoginOtpVerificationPageState createState() =>
      _LoginOtpVerificationPageState();
}

class _LoginOtpVerificationPageState extends State<LoginOtpVerificationPage> {
  static Map<String, String> cookieHeader = {};

  void showErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("OTP is incorrect"),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }

  void showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 6),
        backgroundColor: Colors.green,
      ),
    );
  }

  LoginPage login = LoginPage();
  TextEditingController _otpController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<Map<String, dynamic>> fetchLoggedUserDetails() async {
    final String apiUrl =
        'http://43.205.23.114/api/method/oymom.api.get_logged_user_details';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: cookieHeader,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        showSuccessMessage("fetchLoggedUserDetails successful");

        print('Logged User Details: $jsonResponse');

        return jsonResponse;
      } else {
        print('API Error: ${response.statusCode}');
        print('API Response: ${response.body}');
      }
    } catch (error) {
      print('Error during API call: $error');
    }

    return {};
  }

  Future<void> loginWithOTP() async {
    String apiUrl = 'http://43.205.23.114/api/method/oymom.api.login_with_otp';

    if (widget.mobileNumber.isEmpty) {
      print('Error: Mobile number is empty.');
      return;
    }

    Map<String, String> requestBody = {
      'mobile_no': widget.mobileNumber,
      'otp': widget.generatedOTP,
    };

    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      Map<String, dynamic> responseBody = json.decode(response.body);
      print('Response Body: ${response.body}');
      print(response.headers);

      String fullName = responseBody['full_name'];
      print(fullName);

      if (response.statusCode == 200) {
        String loginRole = responseBody['login_user'];

        if (loginRole == 'Doctor') {
          // Open Doctor home

          await fetchLoggedUserDetails();

          String setCookieHeader = response.headers['set-cookie'] ?? '';
          cookieHeader = {'Cookie': setCookieHeader};
          OtpManagerr.cookieHeader1 = {'Cookie': setCookieHeader};
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('cookie', setCookieHeader);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const DoctorHomePage();
          }));
        } else if (loginRole == 'Farmer') {
          // Open Farmers home

          await fetchLoggedUserDetails();
          String setCookieHeader = response.headers['set-cookie'] ?? '';
          cookieHeader = {'Cookie': setCookieHeader};
          OtpManagerr.cookieHeader1 = {'Cookie': setCookieHeader};
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('cookie', setCookieHeader);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CattleFarmHomePage();
          }));
        } else {
          showUserNotFoundError();

          Future<void> logout() async {
            final String apiUrl = 'http://43.205.23.114/api/method/logout';

            try {
              final response = await http.get(
                Uri.parse(apiUrl),
              );

              if (response.statusCode == 200) {
                print('Logout responce: ${response.body}');
                print('Logout Successful');
              } else {
                print('Logout Error: ${response.statusCode}');
                print('Logout Response: ${response.body}');
              }
            } catch (error) {
              print('Error during logout: $error');
            }
          }

          logout();
          void logoutt() async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('isLoggedIn');
            // Additional cleanup logic if needed
          }

          Future<void> logouttt() async {
            try {
              // Clear cookies from shared preferences
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('cookie');

              // Navigate to the login screen or perform other actions after logout
              // Example: Navigator.pushReplacementNamed(context, '/login');
            } catch (error) {
              print('Error during logout: $error');
            }
          }

          logouttt();
          logoutt();
          // Close the drawer
          Navigator.pop(context);

          // Clear the navigation stack and navigate to the login page
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false,
          );
        }
      } else {
        showErrorMessage();
        print("----------------");
      }
    } catch (error) {
      print('Error during API call: $error');
      showErrorMessage();
    }
  }

  void showUserNotFoundError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User not found!'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color themeColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.generatedOTP),
                Text(OtpManagerr.generatedOTP),
                const Text(
                  'Enter OTP',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    labelText: 'Enter OTP',
                    prefixIcon: Icon(Icons.lock, color: themeColor),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'OTP is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If the OTP is correct, call the login API
                        if (_otpController.text == widget.generatedOTP) {
                          loginWithOTP();
                        } else {
                          // If the OTP is incorrect, show an error message
                          showErrorMessage();
                          print("------------------");
                          print(widget.generatedOTP);
                        }
                      }
                    },
                    child: const Text(
                      'Verify OTP',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
