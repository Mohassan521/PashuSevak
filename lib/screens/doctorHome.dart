import 'package:flutter/material.dart';
import 'package:pashusevak/Utils/localization.dart';
import 'package:pashusevak/screens/appointmentDetails.dart';
import 'package:pashusevak/screens/labReport.dart';
import 'package:pashusevak/screens/livelihoodHistory.dart';
import 'package:pashusevak/screens/marketPlace.dart';
import 'package:pashusevak/screens/message.dart';
import 'package:pashusevak/screens/notificationScreen.dart';
import 'package:pashusevak/screens/pharmacyForDoctors.dart';
import 'package:pashusevak/screens/prescriptionAndReport.dart';
import 'package:pashusevak/screens/uploadDocuments.dart';
import 'package:pashusevak/screens/vaccinationReport.dart';
import 'package:pashusevak/screens/walletScreen.dart';
import 'package:pashusevak/widgets/doctorSideDrawer.dart';
import 'package:pashusevak/widgets/serviceTiles.dart';

class DoctorHomePage extends StatefulWidget {
  final String sid;
  const DoctorHomePage({super.key, required this.sid});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  Locale _locale = Locale('hi', 'IN');

  void _changeLanguage(Locale locale) {
    setState(
      () {
        _locale = locale;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("SID in Doctor home page: ${widget.sid}");

    return Scaffold(
      drawer: DoctorSideDrawer(
        sid: widget.sid,
      ),
      appBar: AppBar(
        
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen()));
            },
            icon: const Icon(
              Icons.message,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
            },
            icon: const Icon(
              Icons.notifications,
            ),
          ),
          // IconButton(
          //   icon: Icon(Icons.language),
          //   onPressed: () {
          //     _changeLanguage(_locale.languageCode == 'en'
          //         ? Locale('hi', 'IN')
          //         : Locale('en', 'US'));
          //   },
          // ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.5, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Localization.of(context)!.translate('services')!,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceTiles(
                    image: "assets/images/prescription.png",
                    name: Localization.of(context)!
                        .translate('prescribe_medicine')!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrescriptionAndReport(
                            sid: widget.sid,
                          ),
                        ),
                      );
                    },
                  ),
                  ServiceTiles(
                    image: "assets/images/wallet.png",
                    name: Localization.of(context)!.translate('wallet_facility')!,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WalletScreen(
                                    sid: widget.sid,
                                  )));
                    },
                  ),
                  ServiceTiles(
                    image: "assets/images/emergencyCare.png",
                    name: Localization.of(context)!
                        .translate('livelihood_history')!,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LivelihoodHistoryForDoctors()));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceTiles(
                    image: "assets/images/app.png",
                    name: Localization.of(context)!.translate('appointments')!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentDetailsPage(
                            sid: widget.sid,
                          ),
                        ),
                      );
                    },
                  ),
                  ServiceTiles(
                    image: "assets/images/marketplace.png",
                    name: Localization.of(context)!.translate('marketplace')!,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MarketPlace()));
                    },
                  ),
                  ServiceTiles(
                    image: "assets/images/pharmacy.png",
                    name: Localization.of(context)!.translate('pharmacy')!,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PharmacyForDoctors()));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceTiles(
                    // image: "assets/images/app.png",
                    icon: Icons.report,
                    // name: Localization.of(context)!.translate('appointments')!,
                    name: Localization.of(context)!.translate('lab_reports')!,
                    onTap: () {
                  
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LabReportScreen()
                        ),
                      );
                    },
                  ),
                  ServiceTiles(
                    // image: "assets/images/marketplace.png",
                    icon: Icons.vaccines,
                    name: Localization.of(context)!.translate('vac_reports')!,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => VaccinationReport()));
                    },
                  ),
                  ServiceTiles(
                    // image: "assets/images/pharmacy.png",
                    icon: Icons.upload_file,
                    name: Localization.of(context)!.translate('upload_docs')!,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UploadDocuments()));
                    },
                  ),
                ],
              ),
                  
              SizedBox(
                height: 12.5,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Nearby Consultants",
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontWeight: FontWeight.w700,
              //           fontSize: 16),
              //     ),
              //     Text(
              //       "See All",
              //       style: TextStyle(
              //           color: Color(0xfffe924b),
              //           fontWeight: FontWeight.w500,
              //           fontSize: 12),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Image.asset(
              //           "assets/images/cow1.png",
              //           width: MediaQuery.sizeOf(context).width * 0.4,
              //         ),
              //         SizedBox(
              //           height: 7.5,
              //         ),
              //         Text(
              //           "Breed Name\n(Vaccinated)",
              //           style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //         Text(
              //           "Rs.80,000",
              //           style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.bold,
              //             color: Color(0xfffe924b),
              //           ),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Image.asset(
              //           "assets/images/cow2.png",
              //           width: MediaQuery.sizeOf(context).width * 0.4,
              //         ),
              //         SizedBox(
              //           height: 7.5,
              //         ),
              //         Text(
              //           "Breed Name\n(Vaccinated)",
              //           style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //         Text(
              //           "Rs.80,000",
              //           style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.bold,
              //             color: Color(0xfffe924b),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
