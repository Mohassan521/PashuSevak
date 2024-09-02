import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pashusevak/screens/cattleListingForm.dart';
import 'package:pashusevak/screens/docto_detail_screeen.dart';
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

class CattleFarmHomePage extends StatefulWidget {
  final String sid;
  const CattleFarmHomePage({super.key, required this.sid});

  @override
  State<CattleFarmHomePage> createState() => _CattleFarmHomePageState();
}

class _CattleFarmHomePageState extends State<CattleFarmHomePage> {
  Position? _currentPosition;
  List<Map<String, dynamic>> _doctors = [];
  bool _loading = true;
  GoogleMapController? mapController;
  LatLng? _userLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation().then((_) {
      _fetchDoctors();
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (_userLocation != null) {
      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_userLocation!, 12.0),
      );
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print('Error getting location: $e');
      // Optionally, you can use a fallback location here
      setState(() {
        _loading = false; // Ensure loading stops even if location fails
      });
    }
  }

  Future<void> _fetchDoctors() async {
    try {
      final response = await http.get(Uri.parse(
          'http://43.205.23.114/api/method/oymom.api.get_doctor_list'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> doctorList = data['message'];

        final List<Map<String, dynamic>> filteredDoctors =
            doctorList.where((doctor) {
          final double lat = doctor['latitude'];
          final double lng = doctor['longitude'];
          final double distanceInMeters = Geolocator.distanceBetween(
              _currentPosition!.latitude,
              _currentPosition!.longitude,
              lat,
              lng);
          return distanceInMeters <= 15000;
        }).map((doctor) {
          return {
            'name': doctor['name'],
            'latitude': doctor['latitude'],
            'longitude': doctor['longitude'],
            'doctor_name': doctor['doctor_name'],
            'any_experiance': doctor['any_experiance'],
            'visit_fees': doctor['visit_fees'],
            'course': doctor['course'],
            'mobile': doctor['mobile'],
            'email': doctor['email'],
            'job_type': doctor['job_type'],
            'doctor_id': doctor['doctor_id'],
            'location': doctor['location'],
            'last_name': doctor['last_name'],
            'state': doctor['state'],
            'district': doctor['district'],
            'own_clinic_visit_fees': doctor['own_clinic_visit_fees']
          };
        }).toList();

        setState(() {
          _doctors = filteredDoctors;
          _loading = false;
        });
      } else {
        print('Failed to load doctors');
        setState(() {
          _loading = false;
        });
      }
    } catch (e) {
      print('Error fetching doctors: $e');
      setState(() {
        _loading = false;
      });
    }
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
                  ],
                ),
              )),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(25.3960, 68.3578), // Default location
                      zoom: 11.0,
                    ),
                    markers: _userLocation != null
                        ? {
                            Marker(
                              markerId: MarkerId('user_location'),
                              position: _userLocation!,
                              infoWindow: InfoWindow(title: 'Your Location'),
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueRed),
                            ),
                          }
                        : {},
                  ),
                ),
                // Services section
                SizedBox(height: 15),
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
                SizedBox(height: 10),
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
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ServiceTiles(
                        image: "assets/images/wallet.png",
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
                SizedBox(height: 20),
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
                SizedBox(height: 10),
                _loading
                    ? Center(child: CircularProgressIndicator())
                    //         'name': doctor['name'],
                    // 'latitude': doctor['latitude'],
                    // 'longitude': doctor['longitude'],
                    // 'doctor_name' : doctor['doctor_name'],
                    // 'any_experiance' : doctor['any_experiance'],
                    // 'visit_fees' : doctor['visit_fees']
                    : _doctors.isEmpty
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 23.5),
                            child: Text(
                              "No doctor registered near your area",
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 23.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _doctors.map((doctor) {
                                print("All doctor details $doctor");
                                return Card(
                                  elevation: 1.5,
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DoctorDetailsScreen(
                                                      doctorData: doctor,
                                                      sid: widget.sid)));
                                    },
                                    title: Text(doctor['doctor_name']),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Experience: ${doctor['any_experiance']} years",
                                        ),
                                        Text(
                                          "Visit Fees: ₹${doctor['visit_fees'].toString()}",
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                SizedBox(height: 20),
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
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: HealthReports(),
                ),
              ],
            ),
          ),
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

                // FutureBuilder(
                //   future: NetworkApiServices().cattleListItems(widget.sid),
                //   builder: (context, snapshot) {
                //     if (!snapshot.hasData) {
                //       return Center(
                //         child: Text("No Cattle Listing Available"),
                //       );
                //     } else if (snapshot.connectionState ==
                //         ConnectionState.waiting) {
                //       return Center(child: Text("Data is being loaded...."));
                //     } else if (snapshot.hasError || snapshot.data == null) {
                //       return Center(
                //         child: Text("SID expired, Login again"),
                //       );
                //     }

                //     return ListView.builder(
                //         shrinkWrap: true,
                //         scrollDirection: Axis.vertical,
                //         itemCount: snapshot.data!.length,
                //         itemBuilder: (context, index) {
                //           String imageUrl = (snapshot
                //                           .data![index].classifiedAttachments !=
                //                       null &&
                //                   snapshot.data![index].classifiedAttachments
                //                       .isNotEmpty)
                //               ? snapshot.data![index].classifiedAttachments[0]
                //               : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxdAOY_-vITFVI-ej84s2U_ErxhOly-z3y_Q&s";

                //           print(
                //               "type of cattle: ${snapshot.data![index].typeOfCattle}");
                //           return ListTile(
                //             leading: Image.network(
                //               "http://43.205.23.114${imageUrl}",
                //               width: 50, // Adjust size as needed
                //               height: 50,
                //               fit: BoxFit.cover,
                //               errorBuilder: (context, error, stackTrace) {
                //                 return Image.network(
                //                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxdAOY_-vITFVI-ej84s2U_ErxhOly-z3y_Q&s", // Fallback asset image if network image fails
                //                   width: 50,
                //                   height: 50,
                //                   fit: BoxFit.cover,
                //                 );
                //               },
                //             ),
                //             // title: Text(snapshot.data![index].typeOfCattle),
                //           );
                //         });
                //   },
                // )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
