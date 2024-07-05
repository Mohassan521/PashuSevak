import 'package:flutter/material.dart';
import 'package:pashusevak/widgets/healthReports.dart';
import 'package:pashusevak/widgets/nearbyConsultants.dart';
import 'package:pashusevak/widgets/serviceTiles.dart';

class CattleFarmHomePage extends StatefulWidget {
  const CattleFarmHomePage({super.key});

  @override
  State<CattleFarmHomePage> createState() => _CattleFarmHomePageState();
}

class _CattleFarmHomePageState extends State<CattleFarmHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
                  child: Image.asset("assets/images/carouselPic1.png"),
                ),
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
                    children: [
                      ServiceTiles(
                        image: "assets/images/trainingFacility.png",
                        name: "Training\nFacility",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ServiceTiles(
                        image: "assets/images/emergencyCare.png",
                        name: "Emergency\nCare",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ServiceTiles(
                        image: "assets/images/healthReport.png",
                        name: "Health\nReport",
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
                    children: [
                      ServiceTiles(
                        image: "assets/images/prescription.png",
                        name: "Prescription",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ServiceTiles(
                        image: "assets/images/vetLabs.png",
                        name: "Vet Labs",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ServiceTiles(
                        image: "assets/images/pharmacy.png",
                        name: "Pharmacy",
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
                  padding: const EdgeInsets.symmetric(horizontal: 23.5),
                  child: HealthReports(),
                ),
              ],
            ),
          ),

          // sell our service
          Center(
            child: Image.asset("assets/images/coming-soon.jpeg"),
          )
        ]),
      ),
    );
  }
}
