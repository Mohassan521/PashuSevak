import 'package:flutter/material.dart';
import 'package:pashusevak/Utils/localization.dart';
import 'package:pashusevak/screens/FrontPage.dart';
import 'package:pashusevak/screens/ProfileScreen.dart';
import 'package:pashusevak/screens/appointmentHistoryForDoctors.dart';
import 'package:pashusevak/screens/chatForDoctors.dart';
import 'package:pashusevak/screens/ebookForDoctors.dart';
import 'package:pashusevak/screens/pharmacyForDoctors.dart';
import 'package:pashusevak/screens/policyForDoctors.dart';
import 'package:pashusevak/screens/salesForDoctors.dart';
import 'package:pashusevak/screens/subscriptionForDoctors.dart';
import 'package:pashusevak/screens/walletScreen.dart';
import 'package:pashusevak/services/apiServices.dart';
import 'package:pashusevak/widgets/loginScreen.dart';

class DoctorSideDrawer extends StatelessWidget {
  final String sid;
  const DoctorSideDrawer({super.key, required this.sid});

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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                      Localization.of(context)!.translate('doctor')!,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(sid: sid)));
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
                        Localization.of(context)!.translate('profile')!,
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SubscriptionForDoctors()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.subscriptions,
                        color: Colors.black,
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        Localization.of(context)!.translate('subscription')!,
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WalletScreen(
                                    sid: sid,
                                  )));
                  },
                  child: Row(
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
                        Localization.of(context)!.translate('wallet')!,
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PharmacyForDoctors(
                                    
                                  )));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.inventory,
                        color: Colors.black,
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        Localization.of(context)!.translate('inventory')!,
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EBookForDoctors(
                                   
                                  )));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.book,
                        color: Colors.black,
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        Localization.of(context)!.translate('book')!,
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => WalletScreen(
                    //                 sid: sid,
                    //               )));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.black,
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        Localization.of(context)!.translate('share')!,
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatForDoctors(
                                    
                                  )));
                  },
                  child: Row(
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
                        Localization.of(context)!.translate('chat')!,
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => WalletScreen(
                    //                 sid: sid,
                    //               )));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_searching,
                        color: Colors.black,
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        Localization.of(context)!.translate('location-control')!,
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SalesForDoctors(
                                   
                                  )));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.shop_two,
                        color: Colors.black,
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        Localization.of(context)!.translate('sales')!,
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppointmentHistoryForDoctors(
                                   
                                  )));
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
                        Localization.of(context)!.translate('history')!,
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    NetworkApiServices().logout();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => FrontPage()));
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
                        Localization.of(context)!.translate('logout')!,
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1.5,
                  height: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PolicyForDoctors(
                                   
                                  )));
                  },
                  child: Row(
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
                        Localization.of(context)!.translate('policy')!,
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
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
