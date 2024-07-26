import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pashusevak/models/bannerList.dart';
import 'package:pashusevak/screens/cattleListingForm.dart';
import 'package:pashusevak/screens/emergencyCare.dart';
import 'package:pashusevak/screens/healthReports.dart';
import 'package:pashusevak/screens/pharmacyForFarmers.dart';
import 'package:pashusevak/screens/prescribeCattleFarmer.dart';
import 'package:pashusevak/screens/trainingFacility.dart';
import 'package:pashusevak/screens/vetLabs.dart';
import 'package:pashusevak/services/apiServices.dart';
import 'package:pashusevak/widgets/farmerSideDrawer.dart';
import 'package:pashusevak/widgets/healthReports.dart';
import 'package:pashusevak/widgets/nearbyConsultants.dart';
import 'package:pashusevak/widgets/serviceTiles.dart';

class CattleFarmHomePage extends StatefulWidget {
  final String sid;
  const CattleFarmHomePage({super.key, required this.sid});

  @override
  State<CattleFarmHomePage> createState() => _CattleFarmHomePageState();
}

class _CattleFarmHomePageState extends State<CattleFarmHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: FarmerSideDrawer(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xfffe924b),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            )
          ],
          bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.sizeOf(context).height * 0.1),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Color(0xfffec097),
                          borderRadius: BorderRadius.circular(25)),
                      child: TabBar(
                        labelColor: Color(0xfffe924b),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        // labelPadding: EdgeInsets.symmetric(horizontal: 10),
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        indicatorColor: Color(0xfffe924b),
                        tabs: [
                          Tab(
                            text: "Buy our Service",
                          ),
                          Tab(
                            text: "Sell your Service",
                          ),
                        ],
                      ),
                    ),
                    // Expanded(
                    //   child: TabBarView(
                    //     children: [
                    //       Center(
                    //         child: Text("data bohottttt h"),
                    //       ),
                    //       Center(
                    //         child: Text("data bohottttt h"),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              )),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23.5, vertical: 12),
                  child: FutureBuilder<List<Message>>(
                    future: NetworkApiServices().fetchBanners(),
                    builder: (context, snapshot) {
                      return CarouselSlider(
                          items: snapshot.data?.map((banner) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Image.network(
                                    "http://43.205.23.114/${banner.banner}",
                                    fit: BoxFit.cover,
                                  ),
                                  // child: Text(banner.sequence.toString()),
                                );
                              },
                            );
                          }).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlay: true,
                          ));
                    },
                  ),
                ),

                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 23.5, vertical: 12),
                //   child: Image.asset("assets/images/carouselPic1.png"),
                // ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.5),
                  child: Text(
                    "Services",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.5),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ServiceTiles(
                        image: "assets/images/trainingFacility.png",
                        name: "Training\nFacility",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainingFacility(),
                            ),
                          );
                        },
                      ),
                      ServiceTiles(
                        image: "assets/images/emergencyCare.png",
                        name: "Emergency\nCare",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmergencyCare()));
                        },
                      ),
                      ServiceTiles(
                        image: "assets/images/healthReport.png",
                        name: "Health\nReport",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HealthReportsPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ServiceTiles(
                        image: "assets/images/prescription.png",
                        name: "Prescription",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PrescriptionAndReportForFarmer(),
                            ),
                          );
                        },
                      ),
                      ServiceTiles(
                        image: "assets/images/vetLabs.png",
                        name: "Vet Labs",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VetLabs(),
                            ),
                          );
                        },
                      ),
                      ServiceTiles(
                        image: "assets/images/pharmacy.png",
                        name: "Pharmacy",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PharmacyForFarmers()));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.5),
                  child: Row(
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
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.5),
                  child: NearbyConsultants(),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Health Reports",
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
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: HealthReports(),
                ),
              ],
            ),
          ),

          // sell our service
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CattleListingForm(
                          sid: widget.sid,
                        ),
                      ),
                    );
                  },
                  child: Text("List Your Cattle"),
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: Colors.orange,
                  textColor: Colors.white,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
