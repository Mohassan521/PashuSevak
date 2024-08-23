import 'package:flutter/material.dart';
import 'package:pashusevak/Utils/localization.dart';
import 'package:pashusevak/screens/appointmentDetails.dart';
import 'package:pashusevak/screens/marketPlace.dart';
import 'package:pashusevak/screens/prescriptionAndReport.dart';
import 'package:pashusevak/screens/walletScreen.dart';
import 'package:pashusevak/widgets/doctorSideDrawer.dart';
import 'package:pashusevak/widgets/serviceTiles.dart';

class PashuSevakHomePage extends StatefulWidget {
  const PashuSevakHomePage({super.key});

  @override
  State<PashuSevakHomePage> createState() => _PashuSevakHomePageState();
}

class _PashuSevakHomePageState extends State<PashuSevakHomePage> {
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
    return Scaffold(
      drawer: DoctorSideDrawer(sid: "",),
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              Localization.of(context)!.translate('location') ?? "",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            Text(
              Localization.of(context)!.translate('gujarat_ind')!,
              style: TextStyle(fontSize: 16, color: Colors.black),
            )
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message,
            ),
          ),
          IconButton(
            onPressed: () {},
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
      body: Padding(
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
                  color: Color(0xffFFDBBB),
                  image: "assets/images/prescription.png",
                  name: Localization.of(context)!
                      .translate('prescribe_medicine')!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrescriptionAndReport(sid: "",),
                      ),
                    );
                  },
                ),
                ServiceTiles(
                  color: Color(0xffFFDBBB),
                  image: "assets/images/wallet.png",
                  name: Localization.of(context)!.translate('wallet_facility')!,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WalletScreen()));
                  },
                ),
                ServiceTiles(
                  color: Color(0xffFFDBBB),
                  image: "assets/images/emergencyCare.png",
                  name: Localization.of(context)!
                      .translate('livelihood_history')!,
                  onTap: () {},
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
                  color: Color(0xffFFDBBB),
                  image: "assets/images/app.png",
                  name: "Appointments",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentDetailsPage(
                          sid: "",
                        ),
                      ),
                    );
                  },
                ),
                ServiceTiles(
                  color: Color(0xffFFDBBB),
                  image: "assets/images/marketplace.png",
                  name: "Inventory",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MarketPlace()));
                  },
                ),
                ServiceTiles(
                  color: Color(0xffFFDBBB),
                  image: "assets/images/pharmacy.png",
                  name: "Lab Sample Collection",
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: 12.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nearby Consultants",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                      color: Color(0xfffe924b),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/cow1.png",
                      width: MediaQuery.sizeOf(context).width * 0.4,
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    Text(
                      "Breed Name\n(Vaccinated)",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Rs.80,000",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffe924b),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/cow2.png",
                      width: MediaQuery.sizeOf(context).width * 0.4,
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    Text(
                      "Breed Name\n(Vaccinated)",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Rs.80,000",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffe924b),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
