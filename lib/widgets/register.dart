import 'package:flutter/material.dart';
import 'package:pashusevak/Utils/utils.dart';
// import 'package:pashusevak/widgets/loginScreen.dart';
// import 'package:simple_icons/simple_icons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController displayName = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = false;
  bool confirmPasswordVisibility = false;

  // final _auth = FirebaseAuth.instance;

  // void signUp(
  //     String email, String password, String role, String displayName) async {
  //   await _auth
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((value) => {postDetailsToFirestore(email, role, displayName)})
  //       .catchError((e) {
  //     print(e.toString());
  //   });
  // }

  // postDetailsToFirestore(String email, String rool, String display_name) async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   var user = _auth.currentUser;
  //   CollectionReference ref = firebaseFirestore.collection('registeredUsers');
  //   ref.doc(user!.uid).set({
  //     'email': emailController.text,
  //     'role': role,
  //     'display_name': display_name
  //   });
  //   Utils().toastMessage("User Registered");

  //   // Navigator.pushReplacement(
  //   //     context, MaterialPageRoute(builder: (context) => LoginPage()));
  // }

  var role = "Farmer";

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
                  labelText: 'Phone Number',
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
            ],
          ),
          MaterialButton(
            onPressed: () {},
            child: Text("Register"),
            minWidth: double.infinity,
            textColor: Colors.white,
            color: Color(0xfff89255),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ],
      ),
    );
  }
}
