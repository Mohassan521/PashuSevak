import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pashusevak/Utils/localization.dart';
import 'package:pashusevak/screens/FrontPage.dart';
import 'package:pashusevak/screens/cattleFarmHome.dart';
import 'package:pashusevak/screens/doctorHome.dart';
import 'package:pashusevak/widgets/loginScreen.dart';
import 'package:pinput/pinput.dart';
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

      if (response.statusCode == 200) {
        String loginRole = responseBody['login_user'];

        if (loginRole == 'Doctor' || loginRole == 'Farmer') {
          await fetchLoggedUserDetails();

          String setCookieHeader = response.headers['set-cookie'] ?? '';
          cookieHeader = {'Cookie': setCookieHeader};
          OtpManagerr.cookieHeader1 = {'Cookie': setCookieHeader};
          print("print cookie header: $setCookieHeader");
          SharedPreferences prefs = await SharedPreferences.getInstance();

          // Extract and save SID
          String? sid = _extractSidFromCookies(setCookieHeader);
          if (sid != null) {
            await prefs.setString('sid', sid);

            print('SID stored: $sid');
          }
          await prefs.setString("role", loginRole);
          String role = prefs.getString("role")!;
          print("role: $role");
          String storedSid = prefs.getString('sid') ?? "";

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                if (loginRole == 'Doctor') {
                  return DoctorHomePage(
                    sid: storedSid,
                  );
                } else if (loginRole == 'Farmer') {
                  return CattleFarmHomePage(
                    sid: storedSid,
                  );
                } else {
                  return FrontPage();
                }
              },
            ),
          );
        } else {
          showUserNotFoundError();
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

  String? _extractSidFromCookies(String cookies) {
    final cookieList = cookies.split('; ');
    for (var cookie in cookieList) {
      if (cookie.startsWith('sid=')) {
        return cookie.substring(4); // remove 'sid=' prefix
      }
    }
    return null; // sid not found
  }

  void showUserNotFoundError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User not found!'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _validateAndSubmitOTP(String otp) {
    if (_formKey.currentState!.validate()) {
      // Check if the OTP is correct
      if (otp == widget.generatedOTP) {
        loginWithOTP();
      } else {
        showErrorMessage();
        print("------------------");
        print(widget.generatedOTP);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 56,
        height: 60,
        textStyle: TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.transparent),
        ));
    return Scaffold(
      appBar: AppBar(
        title:  Text(Localization.of(context)!
                      .translate('otp')!),
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
                Container(
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration?.copyWith(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onCompleted: (value) {
                      _validateAndSubmitOTP(value);
                    },
                  ),
                ),
                // TextFormField(
                //   controller: _otpController,
                //   decoration: InputDecoration(
                //     labelText: 'Enter OTP',
                //     prefixIcon: Icon(Icons.lock, color: themeColor),
                //   ),
                //   keyboardType: TextInputType.number,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'OTP is required';
                //     }
                //     return null;
                //   },
                // ),
                // const SizedBox(height: 16),
                // Container(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Theme.of(context).primaryColor,
                //     ),
                //     onPressed: () {
                //       if (_formKey.currentState!.validate()) {
                //         // If the OTP is correct, call the login API
                //         if (_otpController.text == widget.generatedOTP) {
                //           loginWithOTP();
                //         } else {
                //           // If the OTP is incorrect, show an error message
                //           showErrorMessage();
                //           print("------------------");
                //           print(widget.generatedOTP);
                //         }
                //       }
                //     },
                //     child: const Text(
                //       'Verify OTP',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
