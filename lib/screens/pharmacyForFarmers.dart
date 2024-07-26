import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PharmacyForFarmers extends StatefulWidget {
  const PharmacyForFarmers({Key? key}) : super(key: key);

  @override
  State<PharmacyForFarmers> createState() => _PharmacyForFarmersState();
}

class _PharmacyForFarmersState extends State<PharmacyForFarmers> {
  late GoogleMapController mapController;
  int selectedContainerIndex = 0;
  static const LatLng sourceLocation = LatLng(19.200443542, 73.021933668);
  LatLng destination = LatLng(36.42796133580664, 73.021933668);

  static const LatLng _center = LatLng(19.200443542, 73.021933668);

  @override
  void initState() {
    super.initState();
    fetchDestination();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void selectContainer(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

  Future<void> fetchDestination() async {
    final response = await http.get(
        Uri.parse('http://43.205.23.114/api/method/oymom.api.get_doctor_list'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final doctor =
          data['message'][0]; // Assuming the first doctor's location is used
      final double lat = doctor['latitude'];
      final double lng = doctor['longitude'];

      setState(() {
        destination = LatLng(lat, lng);
      });
    } else {
      // Handle error
      print('Failed to load destination');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pharmacy For Farmers"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('source'),
                  position: sourceLocation,
                ),
                Marker(
                  markerId: const MarkerId('destination'),
                  position: destination,
                ),
              },
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
              buildSelectableContainer(0),
              buildSelectableContainer(1),
              buildSelectableContainer(2),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MaterialButton(
              height: 50,
              minWidth: double.infinity,
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {},
              child: const Center(
                child: Text(
                  "Request",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSelectableContainer(int index) {
    bool isSelected = selectedContainerIndex == index;
    return GestureDetector(
      onTap: () => selectContainer(index),
      child: Container(
        width: 110,
        height: 130,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 243, 243, 243),
            border: Border.all(
              color: isSelected ? Colors.orange : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/docAvatar.png"),
              Text(
                'Doctor ${index + 1}',
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
