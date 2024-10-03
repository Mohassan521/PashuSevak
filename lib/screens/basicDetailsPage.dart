import 'package:flutter/material.dart';
import 'package:pashusevak/models/loggedUserModel.dart';

class BasiceDetailsPage extends StatelessWidget {
  final LoggedUserModel modelData;
  const BasiceDetailsPage({super.key, required this.modelData});

  @override
  Widget build(BuildContext context) {

    TextEditingController name = TextEditingController();
    TextEditingController fname = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController contact = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController location = TextEditingController();


    name.text = modelData.farmerName ?? modelData.doctorName!;
    address.text = modelData.address ?? "";    
    contact.text = modelData.mobile ?? "";
    email.text = modelData.email ?? "";
    location.text = modelData.location ?? "";
    fname.text = modelData.fathersName ?? modelData.fatherName!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Father Name"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: fname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Address"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: address,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Contact Number"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: contact,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Email Address"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Location"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: location,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
              ],
            ),

            MaterialButton(onPressed: (){

            },
            color: Colors.orange,
            child: Text("Continue"),
            textColor: Colors.white,
            padding: EdgeInsets.all(12.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            minWidth: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}