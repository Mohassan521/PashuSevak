import 'package:flutter/material.dart';

class AppointmentDetailsPage extends StatelessWidget {
  const AppointmentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: () {}, child: Icon(Icons.arrow_back)),
        title: Text("Appointment Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
