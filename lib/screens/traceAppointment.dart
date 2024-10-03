import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class TraceAppointments extends StatefulWidget {
  final double doctorLatitude;
  final double doctorLongitude;

  const TraceAppointments({
    super.key,
    required this.doctorLatitude,
    required this.doctorLongitude,
  });

  @override
  _TraceAppointmentsState createState() => _TraceAppointmentsState();
}

class _TraceAppointmentsState extends State<TraceAppointments> {
  late GoogleMapController _mapController;
  late CameraPosition _initialCameraPosition;
  late Marker _doctorMarker;
  Marker? _userMarker;
  Polyline? _curvedPolyline;
  BitmapDescriptor? _doctorIcon;
  BitmapDescriptor? _homeIcon;

  @override
  void initState() {
    super.initState();
    _loadCustomMarkers();

    // Set the initial position to the doctor's location
    _initialCameraPosition = CameraPosition(
      target: LatLng(widget.doctorLatitude, widget.doctorLongitude),
      zoom: 15,
    );

    // Fetch the user's current location
    _getUserLocation();
  }

  // Function to load custom icons for markers
  Future<void> _loadCustomMarkers() async {
    _doctorIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/images/doctor_icon.png',
    );
    _homeIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/images/home_icon.png',
    );

    setState(() {
      // Marker for doctor's location
      _doctorMarker = Marker(
        markerId: MarkerId('doctorMarker'),
        position: LatLng(widget.doctorLatitude, widget.doctorLongitude),
        infoWindow: InfoWindow(title: 'Doctor\'s Location'),
        icon: _doctorIcon!,
      );
    });
  }

  List<LatLng> _createCurvedPath(LatLng p1, LatLng p2) {
    const int segments = 100;
    List<LatLng> path = [];

    double midLat = (p1.latitude + p2.latitude) / 2;
    double midLng = (p1.longitude + p2.longitude) / 2;

    double arcHeight = 0.005;

    for (int i = 0; i <= segments; i++) {
      double t = i / segments;

      double lat = p1.latitude * (1 - t) + p2.latitude * t;
      double lng = p1.longitude * (1 - t) + p2.longitude * t;

      double offsetLat = lat + arcHeight * sin(t * pi);
      path.add(LatLng(offsetLat, lng));
    }
    return path;
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition();

    setState(() {
      _userMarker = Marker(
        markerId: MarkerId('userMarker'),
        position: LatLng(position.latitude, position.longitude),
        infoWindow: InfoWindow(title: 'Your Location'),
        icon: _homeIcon ??
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      );

      List<LatLng> curvedPath = _createCurvedPath(
        LatLng(position.latitude, position.longitude),
        LatLng(widget.doctorLatitude, widget.doctorLongitude),
      );

      _curvedPolyline = Polyline(
        polylineId: PolylineId('curvedRoute'),
        points: curvedPath,
        color: Color.fromARGB(255, 245, 118, 0),
        width: 5,
      );

      _mapController.animateCamera(CameraUpdate.newLatLng(
        LatLng(position.latitude, position.longitude),
      ));
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trace Appointment"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        markers: {
          _doctorMarker,
          if (_userMarker != null) _userMarker!,
        },
        polylines: {
          if (_curvedPolyline != null) _curvedPolyline!,
        },
        myLocationEnabled: true,
        mapType: MapType.normal,
        zoomControlsEnabled: true,
      ),
    );
  }
}
