import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pashusevak/screens/PashuSevakScreens/basicDetails.dart';
import 'package:pashusevak/screens/basicDetailsPage.dart';
import 'package:pashusevak/services/apiServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  final String sid;
  const ProfileScreen({super.key, required this.sid});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _saveEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: FutureBuilder(
              future: NetworkApiServices().getUserDetails(widget.sid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  Center(
                    child: Text("Data is being loaded..."),
                  );
                } else if (!snapshot.hasData) {
                  Text("No Data found");
                } else if (snapshot.data == null || snapshot.hasError) {
                  Center(child: Text("Data is being loaded..."));
                } else if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BasiceDetailsPage(
                                    modelData: snapshot.data!,
                                  )));
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      maxRadius: 26.5,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data!.farmerName ??
                                              snapshot.data!.doctorName!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 19),
                                        ),
                                        Text(snapshot.data!.address ?? "")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                          Divider(
                            height: 35,
                            thickness: 0.5,
                          ),
                          Text(
                            "Display",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Appearance",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Colors",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18.5,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Account",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Countries",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18.5,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Privacy",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18.5,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Phone Number",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18.5,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Notifications",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18.5,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Security",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Change Security Settings",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18.5,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Support",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18.5,
                                  ))
                            ],
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 50,
                      // ),
                      // Column(
                      //   children: [
                      //     Text(
                      //       "#गाँव का नायक",
                      //       style: TextStyle(
                      //         fontSize: 18, // Increase font size
                      //         fontWeight: FontWeight.bold, // Bold text
                      //         color: Colors.black, // Set a custom color
                      //       ),
                      //       textAlign:
                      //           TextAlign.center, // Center-align the text
                      //     ),
                      //     SizedBox(height: 5),
                      //     Text(
                      //       "#gaowkanayak",
                      //       style: TextStyle(
                      //         fontSize: 18, // Increase font size
                      //         fontWeight: FontWeight.bold, // Bold text
                      //         color: Colors.black, // Set a custom color
                      //       ),
                      //       textAlign:
                      //           TextAlign.center, // Center-align the text
                      //     ),
                      //     SizedBox(height: 5),
                      //     Text(
                      //       "Made For Pashuseva",
                      //       style: TextStyle(
                      //         fontSize: 18, // Increase font size
                      //         fontWeight: FontWeight.bold, // Bold text
                      //         color: Colors.black, // Set a custom color
                      //       ),
                      //       textAlign:
                      //           TextAlign.center, // Center-align the text
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         RichText(
                      //           text: TextSpan(
                      //             text: "🇮🇳 ", // Flag emoji
                      //             style: TextStyle(fontSize: 18),
                      //           ),
                      //         ),
                      //         Text(
                      //           "Crafted By Bihar, India",
                      //           style: TextStyle(
                      //             fontSize: 16, // Slightly smaller font size
                      //             fontWeight: FontWeight.w600, // Semi-bold text
                      //             color: Colors.orange, // Set a custom color
                      //             fontStyle:
                      //                 FontStyle.italic, // Italicize the text
                      //           ),
                      //           textAlign:
                      //               TextAlign.center, // Center-align the text
                      //         ),
                      //       ],
                      //     ),
                      //     // Add some space between the texts

                      //     Divider(
                      //       color: Colors.grey, // Color of the divider
                      //       thickness: 1, // Thickness of the divider
                      //       height: 20, // Space before and after the divider
                      //     ),
                      //   ],
                      // ),
                    ],
                  );
                }
                return Center(child: Text("No Data Available"));
              },
            ),
          ),
        ));
  }
}
