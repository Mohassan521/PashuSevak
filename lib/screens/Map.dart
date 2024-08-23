import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.onLocationSelected})
      : super(key: key);

  final Function(String) onLocationSelected;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(19.176667, 73.022222),
    zoom: 14,
  );

  List<Marker> _marker = [];

  String userCurrentLocation = "Unknown";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          Position position = await getUserCurrentLocation();

          // Reverse geocoding to get place name from coordinates
          List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude,
            position.longitude,
          );

          if (placemarks.isNotEmpty) {
            Placemark placemark = placemarks[0];
            userCurrentLocation = "${placemark.name}, ${placemark.locality}";
          } else {
            userCurrentLocation = "Unknown";
          }

          _marker.add(
            Marker(
              markerId: MarkerId('1'),
              position: LatLng(position.latitude, position.longitude),
              infoWindow: InfoWindow(title: userCurrentLocation),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
            ),
          );

          // Pass the selected location back to the previous screen
          widget.onLocationSelected(userCurrentLocation);

          CameraPosition cameraPosition = CameraPosition(
            zoom: 14,
            target: LatLng(position.latitude, position.longitude),
          );

          final GoogleMapController controller = await _controller.future;
          controller
              .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
          setState(() {});
        },
        child: Icon(Icons.location_disabled_outlined),
      ),
    );
  }
}

Future<Position> getUserCurrentLocation() async {
  await Geolocator.requestPermission()
      .then((value) {})
      .onError((error, stackTrace) {
    print("error");
  });

  return await Geolocator.getCurrentPosition();
}
