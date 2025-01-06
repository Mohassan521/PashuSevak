import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pashusevak/screens/registrationForDoctors.dart';
import 'package:pashusevak/screens/registrationForFarmers.dart';
import 'package:pashusevak/screens/roleSelection.dart';
import 'package:pinput/pinput.dart';

class OTPPageForRegstration extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController mobileController;
  final otpp;
  final String role;
  const OTPPageForRegstration({super.key,
    required this.emailController,
    required this.mobileController,
    required this.otpp,
    required this.role

  });

  @override
  State<OTPPageForRegstration> createState() => _OTPPageForRegstrationState();
}

class _OTPPageForRegstrationState extends State<OTPPageForRegstration> {
  void showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );
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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _otpController = TextEditingController();

  Future<void> verifyOTP(String otpEntered) async {
    final apiUrl = 'http://43.205.23.114/api/method/oymom.api.verify_otp';

    // Assuming you have email and mobile controllers in a different class
    // Replace YourControllerClass with the actual class where you have these controllers
    final email = widget.emailController.text;
    final mobile = widget.mobileController.text;
    final otp = otpEntered;

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'mobile_no': mobile,
        'otp': otp,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final message = jsonResponse['message']?['message'];

      if (message == 'OTP verified successfully') {
        showSuccessMessage(message);
        Navigator.push(context, MaterialPageRoute(builder: (context) => RoleSelection(email: widget.emailController,mobile_no: widget.mobileController,)));
        // Navigator.of(context).pushAndRemoveUntil(
        //   MaterialPageRoute(builder: (context) => LoginPage()),
        //       (Route<dynamic> route) => false,
        // );
        // Successful OTP verification, navigate to the next screen
        // if(widget.role == "Farmer"){
        //   Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return RegistrationForFarmer(
        //       emailController: widget.emailController, mobileController: widget.mobileController
        //   );
        // }));
          
        // }
        // else if(widget.role == "Doctor"){
        //   Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return RegistrationForDoctors(
        //       emailController: widget.emailController, mobileController: widget.mobileController
        //   );
        // }));
        // }
        
      } else {
        // OTP verification failed, show an error message to the user
        print('OTP Verification Failed: $message');
        showErrorMessage(message);
        // You may want to display an error message to the user
      }
    } else {
      // API call failed, handle the error
      print('API Error: ${response.statusCode}');
      print('API Response: ${response.body}');
      // You may want to show an error message to the user
    }
  }

//   void _validateAndSubmitOTP(String otp) {
//   // Directly check the OTP without form key validation
//   if (otp == widget.otpp) {
//     verifyOTP();
//   } else {
//     print("Invalid OTP");
//     print("Expected OTP: ${widget.otpp}, Entered OTP: $otp");
//   }
// }

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
        title: Text("OTP Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: Form(
      key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(widget.otpp),
      SizedBox(
                height: 25,
              ),
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
                  verifyOTP(value);
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
              // SizedBox(height: 16),
              // Container(
              //   width: double.infinity,
      
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Theme.of(context).primaryColor,
              //     ),
              //     onPressed: () {
      
              //       if (_formKey.currentState!.validate()) {
              //         verifyOTP();
      
      
              //       }
              //     },
              //     child: Text(
              //       'Verify OTP',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10,)
      
            ],
          ),
        ),
      ),
    );
  }
}
