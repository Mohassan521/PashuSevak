import 'package:flutter/material.dart';

class TraceAppointments extends StatelessWidget {
  final double doctor_latitude;
  final double doctor_longitude;
  const TraceAppointments({super.key, required this.doctor_latitude, required this.doctor_longitude});

  @override
  Widget build(BuildContext context) {

    print("this is doctor latitude and longitude values $doctor_latitude $doctor_longitude");

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Trace Appointment"))
        ],
      ),
    );
  }
}