import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:pashusevak/screens/docto_detail_screeen.dart';

class EmergencyCare extends StatefulWidget {
  final String sid;
  const EmergencyCare({super.key, required this.sid});

  @override
  _EmergencyCareState createState() => _EmergencyCareState();
}

class _EmergencyCareState extends State<EmergencyCare> {
  int selectedContainerIndex = 0;

  static const LatLng _center = LatLng(17.3850, 78.4867); // Hyderabad, India
  static const double _radius = 16000; // 16 km in meters

  final Set<Marker> _markers = {};
  final Set<Circle> _circles = {};
  final List<Marker> _allMarkers = []; // To keep track of all markers

  Map<String, dynamic> markerDataMap = {};

  final List<String> images = [
    'assets/images/docAvatar.png', // Doctor
    'assets/images/peshusevak01.png', // Para vet
    'assets/images/ai1.png' // AI Worker
  ];

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    try {
      ByteData data = await rootBundle.load(path);
      ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
          targetHeight: width);
      ui.FrameInfo fi = await codec.getNextFrame();
      return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
          .buffer
          .asUint8List();
    } catch (e) {
      print('Error loading marker image: $e');
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    _addCenterMarker();
    _addCircle();
    fetchMarkersFromAPI();
  }

  Future<void> fetchMarkersFromAPI() async {
    try {
      final response = await http.get(
        Uri.parse('http://43.205.23.114/api/method/oymom.api.get_doctor_list'),
      );

      print('API response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List doctors = data['message'];

        for (int i = 0; i < doctors.length; i++) {
          final doctor = doctors[i];
          final double lat = doctor['latitude'];
          final double lng = doctor['longitude'];
          final String role = doctor['are_you'].trim();

          print('Marker $i role: $role');

          String imagePath;

          if (role.toLowerCase() == 'doctor') {
            imagePath = images[0];
          } else if (role.toLowerCase() == 'para vet') {
            imagePath = images[1];
          } else if (role.toLowerCase() == 'ai worker') {
            imagePath = images[2];
          } else {
            imagePath = images[0];
            print('Unknown role: $role, defaulting to Doctor');
          }

          final Uint8List markerIcon = await getBytesFromAssets(imagePath, 100);

          final markerId = MarkerId(i.toString());

          final marker = Marker(
            markerId: markerId,
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(title: '$role Marker: $i'),
            icon: BitmapDescriptor.fromBytes(markerIcon),
            onTap: () {
              _onMarkerTapped(markerId);
            },
          );

          _allMarkers.add(marker);
          markerDataMap[markerId.value] = doctor;
        }

        _filterMarkers(); // Initially filter markers based on the selected container
      } else {
        print('Failed to load markers. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching markers: $e');
    }
  }

  void _addCenterMarker() {
    _markers.add(
      Marker(
        markerId: const MarkerId('center_marker'),
        position: _center,
        infoWindow: const InfoWindow(title: 'Hyderabad Center'),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
  }

  void _addCircle() {
    _circles.add(
      Circle(
        circleId: const CircleId('radius_circle'),
        center: _center,
        radius: _radius,
        fillColor: const Color.fromARGB(255, 255, 173, 167)
            .withOpacity(0.2), // Light color for the radius
        strokeColor: Colors.red,
        strokeWidth: 1,
      ),
    );
  }

  void _filterMarkers() {
    String selectedRole;
    switch (selectedContainerIndex) {
      case 0:
        selectedRole = 'doctor';
        break;
      case 1:
        selectedRole = 'para vet';
        break;
      case 2:
        selectedRole = 'ai worker';
        break;
      default:
        selectedRole = 'doctor';
    }

    _markers.clear();
    _markers.addAll(
      _allMarkers.where(
        (marker) {
          final doctorData = markerDataMap[marker.markerId.value];
          final String role = doctorData['are_you'].trim().toLowerCase();
          return role == selectedRole;
        },
      ),
    );

    // Re-add the center marker
    _addCenterMarker();

    setState(() {});
  }

  void _onMarkerTapped(MarkerId markerId) {
    final doctorData = markerDataMap[markerId.value];
    if (doctorData != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoctorDetailsScreen(doctorData: doctorData, sid: widget.sid,),
        ),
      );
    } else {
      print('No doctor data found for markerId: ${markerId.value}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Care Map'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated:
                  (controller) {}, // Leave this empty if not using mapController
              initialCameraPosition: const CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: _markers,
              circles: _circles,
            ),
          ),
          buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSelectableContainer(
                index: 0,
                imagePath: "assets/images/docAvatar.png",
                label: 'Doctor',
              ),
              buildSelectableContainer(
                index: 1,
                imagePath: 'assets/images/peshusevak01.png',
                label: 'Para vet',
              ),
              buildSelectableContainer(
                index: 2,
                imagePath: 'assets/images/ai1.png',
                label: 'AI Worker',
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildSelectableContainer({
    required int index,
    required String imagePath,
    required String label,
  }) {
    bool isSelected = selectedContainerIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedContainerIndex = index;
          _filterMarkers(); // Filter markers when a container is selected
        });
      },
      child: Container(
        width: 110,
        height: 130,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 243, 243),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
