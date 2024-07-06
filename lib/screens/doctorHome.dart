import 'package:flutter/material.dart';
import 'package:pashusevak/widgets/serviceTiles.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Location",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            Text(
              "Gujrat, Ind",
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
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.5, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Services",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                ServiceTiles(
                  image: "assets/images/prescription.png",
                  name: "Prescribe\nMedicine",
                  onTap: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                ServiceTiles(
                  image: "assets/images/wallet.png",
                  name: "Wallet\nFacility",
                  onTap: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                ServiceTiles(
                  image: "assets/images/emergencyCare.png",
                  name: "Livelihood\nHistory",
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                ServiceTiles(
                  image: "assets/images/app.png",
                  name: "Appointments",
                  onTap: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                ServiceTiles(
                  image: "assets/images/marketplace.png",
                  name: "Marketplace",
                  onTap: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                ServiceTiles(
                  image: "assets/images/pharmacy.png",
                  name: "Pharmacy",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/cow1.png"),
                    SizedBox(
                      height: 7.5,
                    ),
                    Text(
                      "Breed Name . Vaccinated",
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
                    Image.asset("assets/images/cow2.png"),
                    SizedBox(
                      height: 7.5,
                    ),
                    Text(
                      "Breed Name . Vaccinated",
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
