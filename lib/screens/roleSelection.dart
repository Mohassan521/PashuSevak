import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pashusevak/screens/registrationForDoctors.dart';
import 'package:pashusevak/screens/registrationForFarmers.dart';

class RoleSelection extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController mobile_no = TextEditingController();

   RoleSelection({super.key, required this.email, required this.mobile_no});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Back",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/pashu_logo.png", height: 40), // Replace with your actual image path
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Who are you?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Role List
            Expanded(
              child: ListView(
                children: [
                  roleCard("Cattle Farmer", "assets/images/farmer_icon.png", (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForFarmer(emailController: email, mobileController: mobile_no)));
                  }
                  ),
                  roleCard("Doctor", "assets/images/doctor_icon.png",(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForDoctors(emailController: email, mobileController: mobile_no)));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom widget for each role card
  Widget roleCard(String role, String imagePath, void Function()? onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.orange.shade100, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          child: ListTile(
            contentPadding: EdgeInsets.all(14),
            leading: Image.asset(imagePath, height: 40, width: 40), // Role icon
            title: Text(role),
          ),
        ),
      ),
    );
  }
}
