//import 'dart:convert';
// import 'package:pashusevak/services/apiServices.dart';
import 'package:flutter/material.dart';
import 'package:pashusevak/models/availabilityDataModel.dart';
import 'package:pashusevak/screens/appointmentPage.dart';
import 'package:pashusevak/screens/cattleDetails.dart';
import 'package:http/http.dart' as http;
import 'package:pashusevak/services/apiServices.dart';


class DoctorDetailsScreen extends StatefulWidget {
  final String sid;
  final Map<String, dynamic> doctorData;

  const DoctorDetailsScreen({super.key, required this.doctorData, required this.sid});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {

  DateTime? _selectedDate;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Doctor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage("assets/images/doctor.png"),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Doctor Name: ${widget.doctorData['doctor_name'] ?? 'N/A'}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Course: ${widget.doctorData['course'] ?? 'N/A'}',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Text('Father Name: ${doctorData['father_name'] ?? 'N/A'}'),
            // const SizedBox(height: 10),
            // Text('Date of Birth: ${doctorData['date_of_birth'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text('Mobile: ${widget.doctorData['mobile'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text('Email: ${widget.doctorData['email'] ?? 'N/A'}'),
            // const SizedBox(height: 10),
            // Text('Course: ${doctorData['course'] ?? 'N/A'}'),
            // const SizedBox(height: 10),
            // Text(
            //     'Registration Certificate: ${doctorData['registration_of_certificate'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text('Experience: ${widget.doctorData['any_experiance'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text(
                'Preferred Job Location: ${widget.doctorData['prefferd_job_location'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text('Job Type: ${widget.doctorData['job_type'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text('Doctor ID: ${widget.doctorData['doctor_id'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text('Location: ${widget.doctorData['location'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text('Last Name: ${widget.doctorData['last_name'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text('State: ${widget.doctorData['state'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text('District: ${widget.doctorData['district'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text('Visit Fees: ${widget.doctorData['visit_fees'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text(
                'Own Clinic Visit Fees: ${widget.doctorData['own_clinic_visit_fees'] ?? 'N/A'}'),
            SizedBox(
              height: 50,
            ),
            FutureBuilder<HealthcareSchedule>(
  future: NetworkApiServices().fetchHealthcareSchedule(
    widget.doctorData['doctor_id'], 
    widget.sid, 
    DateTime.now()
  ),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('SID expired, login again'));
    } else if (snapshot.hasData && snapshot.data != null) {
      // Safely access the data
      print(snapshot.data!.serviceUnit);

      List<String> timeSlots = snapshot.data!.availSlot
          .map((slot) => slot.getFormattedTimeSlot())
          .toList();

      return MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)),
        color: Colors.orange,
        child: Text(
          "Book Appointment",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AppointmentPage(
                doctor_id: widget.doctorData['doctor_id'], 
                sid: widget.sid,
                doctor_name: widget.doctorData['doctor_name'],
                visit_fees: widget.doctorData['visit_fees'],
                lat: widget.doctorData['latitude'],
                lon: widget.doctorData['longitude'],
              );
            },
          ));
        },
      );
    } else {
      return Center(child: Text('Something went wrong'));
    }
  },
)

            // ListView.builder(
            //   itemCount: slots.length,
            //   itemBuilder: (context, index) {
            //     return MaterialButton(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30)),
            //     color: Colors.orange,
            //     child: Text(
            //       "Book Appointment",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(
            //         builder: (context) {
            //           return AppointmentPage(doctor_id: widget.doctorData['doctor_id'],service_unit: service_unit,);
            //         },
            //       ));
            //     },
            //   );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
