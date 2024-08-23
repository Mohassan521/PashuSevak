import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pashusevak/Utils/localization.dart';
import 'package:http/http.dart' as http;
import 'package:pashusevak/screens/otpForRegistration.dart';
// import 'package:pashusevak/widgets/loginScreen.dart';
// import 'package:simple_icons/simple_icons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool passwordVisibility = false;
  bool confirmPasswordVisibility = false;
  var role = "";

  Future<void> registerUser() async {
    final apiUrl = 'http://43.205.23.114/api/method/oymom.api.generate_otp_for_number_varification';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'mobile_no': _mobileController.text,
          'email': _emailController.text,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final String email = jsonResponse['message']['email'];
        final String otp = jsonResponse['message']['otp'];
        
        _emailController.text = email;

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return OTPPageForRegstration(
              emailController: _emailController,
              mobileController: _mobileController,
              otpp: otp,
              role: role,
            );
          }),
        );
      } else {
        print('API Error: ${response.statusCode}');
        print('API Response: ${response.body}');
      }
    } catch (error) {
      print('Error during API call: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  Localization.of(context)!
                        .translate('signup')!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                // SizedBox(height: 10),
                Text(
                  Localization.of(context)!
                        .translate('message')!,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: "91 ",
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 17.5),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 17.5),
                Container(
                        height: MediaQuery.sizeOf(context).height * 0.055,
                        padding: EdgeInsets.only(left: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.5),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          isExpanded: true,
                          value: role,
        
                          onChanged: (String? newValue) {
                            setState(() {
                              role = newValue ?? role;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                                value: "",
                                child: Center(
                                    child: Text(
                                  'Select role',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Farmer',
                                child: Center(
                                    child: Text(
                                  'Farmer',
                                  style: TextStyle(fontSize: 12),
                                ))),
                            DropdownMenuItem<String>(
                                value: 'Doctor',
                                child: Center(
                                    child: Text('Doctor',
                                        style: TextStyle(fontSize: 12)))),
                          ],
                        ),
                      ),
                // SizedBox(
                //   height: 15,
                // ),
        
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
            SizedBox(
              height: 28,
            ),
            MaterialButton(
              
              onPressed: () {
                registerUser();
              },
              child: Text(Localization.of(context)!
                        .translate('register')!,style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),),
              minWidth: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 11),
            textColor: Colors.black,
            color: Color(0xfff89255),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ],
        ),
      ),
    );
  }
}
