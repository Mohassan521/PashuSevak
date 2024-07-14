import 'package:flutter/material.dart';
import 'package:pashusevak/widgets/completedAppointments.dart';

class AppointmentDetailsPage extends StatelessWidget {
  const AppointmentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Appointment Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                "Active Appointments (1)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Emergency Appointment',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(
                            '30 minutes to arrive',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 20, thickness: 0.75),
                      Text(
                        'Booking ID',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Dr. Kutkutiya Chenak',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Health Status',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Bad Health',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Breed',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Cow',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Divider(height: 20, thickness: 0.75),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.location_on_outlined,
                                color: Colors.black),
                            label: Text(
                              'Get Location',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xfffe924b),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Confirm',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                "Completed Appointments",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
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
            )
          ],
        ),
      ),
    );
  }
}
