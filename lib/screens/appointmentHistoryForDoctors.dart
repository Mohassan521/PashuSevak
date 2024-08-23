import 'package:flutter/material.dart';
import 'package:pashusevak/widgets/completedAppointments.dart';

class AppointmentHistoryForDoctors extends StatelessWidget {
  const AppointmentHistoryForDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment History"),
        centerTitle: true,
      ),
      body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              //     Text(
              //   "Completed Appointments",
              //   style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
                  CompletedAppointments(
                    image: "assets/images/docAvatar.png",
                    appointmentStatus: "Emergency Appointment",
                    address: "Gujrat India, 10C",
                  ),
                  CompletedAppointments(
                    image: "assets/images/docAvatar.png",
                    appointmentStatus: "Emergency Appointment",
                    address: "Gujrat India, 10C",
                  ),
                  CompletedAppointments(
                    image: "assets/images/docAvatar.png",
                    appointmentStatus: "Emergency Appointment",
                    address: "Gujrat India, 10C",
                  )
                ],
              ),
            ),
    );
  }
}