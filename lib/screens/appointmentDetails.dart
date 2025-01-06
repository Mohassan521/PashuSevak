import 'package:flutter/material.dart';
import 'package:pashusevak/services/apiServices.dart';
import 'package:pashusevak/widgets/completedAppointments.dart';

class AppointmentDetailsPage extends StatelessWidget {
  final String sid;
  const AppointmentDetailsPage({super.key, required this.sid});

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
            FutureBuilder(
              future: NetworkApiServices().getAppointmentList(sid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text("Loading Appointments..."));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final appointments = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Active Appointments (${appointments.length})",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.75,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: appointments.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.05),
                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${appointments[index].appointmentType} Appointment',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Divider(height: 20, thickness: 0.75),
                                      Text(
                                        'Booking ID',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        appointments[index].name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Appointment Date & Time',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        "${appointments[index].appointmentDate} ${appointments[index].appointmentTime}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Patient Name',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        appointments[index].patientName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Service Unit',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        appointments[index].serviceUnit,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Status',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        appointments[index].status,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: appointments[index].status == "Open" ? Colors.green : Colors.red
                                        ),
                                      ),
                                      Divider(height: 20, thickness: 0.75),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // TextButton.icon(
                                          //   onPressed: () {},
                                          //   icon: Icon(Icons.location_on_outlined,
                                          //       color: Colors.black),
                                          //   label: Text(
                                          //     'Get Location',
                                          //     style: TextStyle(color: Colors.black),
                                          //   ),
                                          // ),
                                          appointments[index].status == "Open" ? ElevatedButton(
                                            
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xfffe924b),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            onPressed: () {
                                              NetworkApiServices().rejectAppointment(sid, appointments[index].name);
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Reject',
                                                  style:
                                                      TextStyle(color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ) : Text("Appointment already rejected"),
                                        ],
                                      ),
                                    ],
                                                                    ),
                                  );
                              
                                }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text('No appointments available'));
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            //   child: Text(
            //     "Completed Appointments",
            //     style: TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: Column(
            //     children: [
            //       CompletedAppointments(
            //         image: "assets/images/docAvatar.png",
            //         appointmentStatus: "Emergency Appointment",
            //         address: "Gujrat India, 10C",
            //       ),
            //       CompletedAppointments(
            //         image: "assets/images/docAvatar.png",
            //         appointmentStatus: "Emergency Appointment",
            //         address: "Gujrat India, 10C",
            //       ),
            //       CompletedAppointments(
            //         image: "assets/images/docAvatar.png",
            //         appointmentStatus: "Emergency Appointment",
            //         address: "Gujrat India, 10C",
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
