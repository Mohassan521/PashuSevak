import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pashusevak/models/bannerList.dart';
import 'package:pashusevak/screens/cattleListingForm.dart';
import 'package:pashusevak/screens/emergencyCare.dart';
import 'package:pashusevak/screens/healthReports.dart';
import 'package:pashusevak/screens/pharmacyForFarmers.dart';
import 'package:pashusevak/screens/prescribeCattleFarmer.dart';
import 'package:pashusevak/screens/trainingFacility.dart';
import 'package:pashusevak/screens/vetLabs.dart';
import 'package:pashusevak/screens/walletScreen.dart';
import 'package:pashusevak/services/apiServices.dart';
import 'package:pashusevak/widgets/farmerSideDrawer.dart';
import 'package:pashusevak/widgets/healthReports.dart';
import 'package:pashusevak/widgets/nearbyConsultants.dart';
import 'package:pashusevak/widgets/serviceTiles.dart';
import 'package:http/http.dart' as http;

class CattleFarmHomePage extends StatefulWidget {
  final String sid;
  const CattleFarmHomePage({super.key, required this.sid});

  @override
  State<CattleFarmHomePage> createState() => _CattleFarmHomePageState();
}

class _CattleFarmHomePageState extends State<CattleFarmHomePage> {

  late GoogleMapController mapController;
  BitmapDescriptor? customMarkerIcon;
  int selectedContainerIndex = 0;

  static const LatLng sourceLocation = LatLng(25.3960, 68.3578);
  LatLng destination = LatLng(25.3960, 68.3578);

  final List<Marker> _marker = <Marker>[];
  final List<LatLng> _lating = <LatLng>[
    LatLng(25.3960, 68.3578),
    LatLng(25.3960, 68.3578),
  ];
  List<String> images = ['assets.images/man.png'];

  loadData() {
    for (int i = 0; i < images.length; i++) {
      _marker.add(
        Marker(
            markerId: MarkerId(i.toString()),
            position: _lating[i],
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: "This is title mark")),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    fetchDestination();
  }

  Future<void> fetchDestination() async {
    final response = await http.get(
        Uri.parse('http://43.205.23.114/api/method/oymom.api.get_doctor_list'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final doctor = data['message'][0];
      final double lat = doctor['latitude'];
      final double lng = doctor['longitude'];

      setState(() {
        destination = LatLng(lat, lng);
      });
    } else {
      print('Failed to load destination');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  void selectContainer(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: FarmerSideDrawer(
          sid: widget.sid,
        ),
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

                Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: const CameraPosition(
                        target: sourceLocation,
                        zoom: 11.0,
                      ),
                      markers: Set<Marker>.of(_marker),
                    ),
                  ),

                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 23.5, vertical: 12),
                //   child: FutureBuilder<List<Message>>(
                //     future: NetworkApiServices().fetchBanners(),
                //     builder: (context, snapshot) {
                //       return CarouselSlider(
                //           items: snapshot.data?.map((banner) {
                //             return Builder(
                //               builder: (BuildContext context) {
                //                 return Container(
                //                   width: MediaQuery.of(context).size.width,
                //                   margin: EdgeInsets.symmetric(horizontal: 5.0),
                //                   child: Image.network(
                //                     "http://43.205.23.114/${banner.banner}",
                //                     fit: BoxFit.cover,
                //                   ),
                //                   // child: Text(banner.sequence.toString()),
                //                 );
                //               },
                //             );
                //           }).toList(),
                //           options: CarouselOptions(
                //             viewportFraction: 1,
                //             autoPlay: true,
                //           ));
                //     },
                //   ),
                // ),

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
                                  builder: (context) => EmergencyCare(
                                    sid: widget.sid,
                                  )));
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
                    image: "assets/images/wallet.png",
                    // name: Localization.of(context)!.translate('wallet_facility')!,
                    name: "Wallet",
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
                SizedBox(
                  height: 20,
                ),
                
              ],
            ),
          )
        ]),
      ),
    );
  }
}
