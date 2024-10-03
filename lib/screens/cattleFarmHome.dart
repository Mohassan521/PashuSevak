import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pashusevak/Utils/localization.dart';
import 'package:pashusevak/models/bannerList.dart';
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
import 'package:pashusevak/widgets/serviceTiles.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart' as loc;
import 'dart:convert';

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
  String? _location;
  List<Map<String, dynamic>> _doctors = [];
  bool _loading = true;
  LatLng? _userLocation;

  // static const LatLng sourceLocation = LatLng(25.3960, 68.3578);
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
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    loc.Location location = loc.Location();

    // Check if location services are enabled
    bool serviceEnabled = await location.serviceEnabled();

    // if (!serviceEnabled) {
    //   // If services are disabled, show a dialog to turn them on
    //   _showLocationServiceDialog(context);
    //   return;
    // }

    // Proceed with permission check and location fetching
    _checkPermissionAndFetchLocation();
  }

  Future<void> _checkPermissionAndFetchLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    // Request permission if not already granted
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, handle accordingly
        print('Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, handle accordingly
      print('Location permissions are permanently denied');
      return;
    }

    // If permission is granted, fetch the location
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print('Current position: ${position.latitude}, ${position.longitude}');

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _userLocation = LatLng(position.latitude, position.longitude);
          _onMapCreated(mapController);
          
          _location = "${place.street}, ${place.locality}, ${place.country}";
        });
      } else {
        setState(() {
          _location = 'Lat: ${position.latitude}, Long: ${position.longitude}';
        });
      }

      // Now fetch doctors based on the position
      _fetchDoctors(position);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (_userLocation != null) {
      mapController.animateCamera(
        CameraUpdate.newLatLngZoom(_userLocation!, 12.0),
      );
      _marker.add(Marker(
        markerId: const MarkerId('user_location'),
        position: _userLocation ?? LatLng(0, 0),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: const InfoWindow(title: 'Your Location'),
      ));
    }
  }

// Show the dialog asking the user to enable location services
  void _showLocationServiceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enable Location"),
          content: Text(
              "Location services are turned off. Please enable location to proceed."),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text("Turn On"),
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog

                loc.Location location = loc.Location();
                bool serviceEnabled = await location.requestService();

                if (serviceEnabled) {
                  _checkPermissionAndFetchLocation(); // Location services enabled, fetch location
                } else {
                  print('Location services are still disabled.');
                }
              },
            ),
          ],
        );
      },
    );
  }

//   Future<void> _getCurrentLocation() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // Check if location services are enabled
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Prompt the user to enable location services
//     bool locationEnabled = await _showEnableLocationDialog(); // New dialog method to ask user
//     if (!locationEnabled) {
//       return;
//     }
//   }

//   // Check for location permissions
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       print('Location permissions are denied');
//       return;
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are permanently denied, handle accordingly
//     print('Location permissions are permanently denied');
//     return;
//   }

//   // If permissions are granted, get the current position
//   try {
//     _currentPosition = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     print('Current position: $_currentPosition');
//     // Fetch nearby doctors based on the location
//     await _fetchDoctors();
//   } catch (e) {
//     print('Error getting location: $e');
//   }
// }

// Show dialog to the user to enable location settings
// Future<bool> _showEnableLocationDialog() async {
//   bool locationEnabled = false;
//   await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Enable Location"),
//         content: Text("Your location services are disabled. Please turn them on to fetch nearby doctors."),
//         actions: [
//           TextButton(
//             onPressed: () async {
//               Navigator.of(context).pop(); // Close the dialog
//               // Open the device's location settings
//               await Geolocator.openLocationSettings();
//               // Check again if location is enabled
//               locationEnabled = await Geolocator.isLocationServiceEnabled();
//             },
//             child: Text("Open Settings"),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog
//             },
//             child: Text("Cancel"),
//           ),
//         ],
//       );
//     },
//   );
//   return locationEnabled;
// }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  Future<void> _fetchDoctors(Position currentPosition) async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await http.get(Uri.parse(
          'http://43.205.23.114/api/method/oymom.api.get_doctor_list'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> doctorList = data['message'];

        // Filter doctors based on proximity to the user's location (15km radius)
        final List<Map<String, dynamic>> filteredDoctors =
            doctorList.where((doctor) {
          final double lat = doctor['latitude'];
          final double lng = doctor['longitude'];
          final double distanceInMeters = Geolocator.distanceBetween(
              currentPosition.latitude, currentPosition.longitude, lat, lng);
          return distanceInMeters <= 15000; // 15km radius
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
            'own_clinic_visit_fees': doctor['own_clinic_visit_fees'],
          };
        }).toList();

        setState(() {
          _doctors = filteredDoctors;
          _loading = false; // Stop loading after fetching doctors
        });
      } else {
        print('Failed to load doctors');
        setState(() {
          _loading = false; // Stop loading if the request fails
        });
      }
    } catch (e) {
      print('Error fetching doctors: $e');
      setState(() {
        _loading = false; // Stop loading if an error occurs
      });
    }
  }

  late final Marker marker;

  @override
  Widget build(BuildContext context) {
    print("User Location: $_userLocation");
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: FarmerSideDrawer(
          sid: widget.sid,
        ),
        // drawer: FarmerSideDrawer(),
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
            ),
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
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TabBar(
                      labelColor: Color(0xfffe924b),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      tabs: [
                        Tab(text: Localization.of(context)!.translate('buy_our_service')!),
                        Tab(text: Localization.of(context)!.translate('sell_your_service')!),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          _location != null
                              ? 'Your Location: $_location'
                              : 'Fetching location...',
                          style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _userLocation ?? LatLng(24.8607, 67.0011),
                            zoom: 11.0,
                          ),
                          markers: Set<Marker>.of(_marker),
                        ),
                      ),
                      SizedBox(height: 15),
                       Padding(
                        padding: EdgeInsets.symmetric(horizontal: 23.5),
                        child: Text(
                          Localization.of(context)!.translate('services')!,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.5,
                          ),
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
                              name: Localization.of(context)!.translate('training_facility')!,
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
                              name: Localization.of(context)!.translate('emergency')!,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EmergencyCare(
                                        sid: widget.sid,
                                      ),
                                    ));
                              },
                            ),
                            ServiceTiles(
                              image: "assets/images/healthReport.png",
                              name: Localization.of(context)!.translate('health_rep')!,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HealthReportsPage()),
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
                              name: Localization.of(context)!.translate('wallet')!,
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
                              name: Localization.of(context)!.translate('vet_labs')!,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VetLabs()),
                                );
                              },
                            ),
                            ServiceTiles(
                              image: "assets/images/pharmacy.png",
                              name: Localization.of(context)!.translate('pharmacy')!,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PharmacyForFarmers()));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 23.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Localization.of(context)!.translate('nearby_doc')!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      _loading
                          ? Center(child: CircularProgressIndicator())
                          : _doctors.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 23.5),
                                  child: Text(
                                    Localization.of(context)!.translate('no_doctor')!,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.red),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 23.5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        padding: EdgeInsets.symmetric(horizontal: 23.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Localization.of(context)!.translate('health_rep')!,
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
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 23.5, vertical: 12),
                        child: FutureBuilder<List<Message>>(
                          future: NetworkApiServices().fetchBanners(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child: Text("Loading Banner Images"));
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return Center(child: Text("No image available"));
                            }
                            return slider.CarouselSlider(
                                items: snapshot.data?.map((banner) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.network(
                                            "http://43.205.23.114/${banner.banner}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // child: Text(banner.sequence.toString()),
                                      );
                                    },
                                  );
                                }).toList(),
                                options: slider.CarouselOptions(
                                  viewportFraction: 1,
                                  autoPlay: true,
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CattleListingForm(sid: widget.sid),
                        ),
                      );
                    },
                    child: Text("List Your Cattle"),
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
