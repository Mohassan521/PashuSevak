import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pashusevak/Utils/utils.dart';
import 'package:pashusevak/widgets/loginScreen.dart';
import 'package:simple_icons/simple_icons.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController displayName = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = false;
  bool confirmPasswordVisibility = false;

  final _auth = FirebaseAuth.instance;

  void signUp(
      String email, String password, String role, String displayName) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore(email, role, displayName)})
        .catchError((e) {
      print(e.toString());
    });
  }

  postDetailsToFirestore(String email, String rool, String display_name) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = firebaseFirestore.collection('registeredUsers');
    ref.doc(user!.uid).set({
      'email': emailController.text,
      'role': role,
      'display_name': display_name
    });
    Utils().toastMessage("User Registered");

    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  var role = "Farmer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              controller: displayName,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: 10),
            Container(
              // height: MediaQuery.sizeOf(context).height * 0.055,
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
                isExpanded: true,
                value: role,
                onChanged: (String? newValue) {
                  setState(() {
                    // entranceDoorValue = newValue ?? entranceDoorValue;
                    role = newValue ?? role;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                      value: 'Farmer',
                      child: Text(
                        'CattleFarmer',
                        style: TextStyle(fontSize: 12),
                      )),
                  DropdownMenuItem<String>(
                      value: 'Doctor',
                      child: Text('Doctor', style: TextStyle(fontSize: 12))),
                  DropdownMenuItem<String>(
                      value: 'Pashusevak',
                      child:
                          Text('Pashu Sevak', style: TextStyle(fontSize: 12))),
                ],
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
              onPressed: () {
                if (emailController.text.isNotEmpty &&
                    displayName.text.isNotEmpty &&
                    role.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  signUp(emailController.text, passwordController.text, role,
                      displayName.text);
                }
              },
              child: Text("Register"),
              minWidth: double.infinity,
              textColor: Colors.white,
              color: Color(0xfff89255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
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
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                  ),
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
                  label:
                      Text('Facebook', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
