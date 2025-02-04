import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pashusevak/screens/FrontPage.dart';
import 'package:pashusevak/screens/ProfileScreen.dart';
import 'package:pashusevak/screens/appointmentsList.dart';
import 'package:pashusevak/services/apiServices.dart';
import 'package:pashusevak/widgets/loginScreen.dart';

class FarmerSideDrawer extends StatelessWidget {
  final String sid;
  const FarmerSideDrawer({super.key, required this.sid});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 38,
          ),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 45,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Farmer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  // MaterialButton(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   padding: EdgeInsets.all(12.5),
                  //   onPressed: () {},
                  //   color: Color(0xfffe924a),
                  //   child: Center(
                  //     child: Text(
                  //       "Profile & Settings",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.w700,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
              SizedBox(
                height: 28,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(
                    sid: sid,
                  ),),);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 23.5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23.5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.shop,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Subscription",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23.5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.chat,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Chat",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23.5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.wallet,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Wallet",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23.5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentList(sid: sid)));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.history,
                      color: Colors.black,
                      size: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Current Appointments",
                      style: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 23.5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.history,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Appointment History",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23.5,
              ),
              InkWell(
                onTap: () {
                  // logout();
                  NetworkApiServices().logout();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FrontPage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                      size: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 23.5,
              ),
              Divider(
                thickness: 1.5,
                height: 5,
              ),
              SizedBox(
                height: 23.5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Help & Support",
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
