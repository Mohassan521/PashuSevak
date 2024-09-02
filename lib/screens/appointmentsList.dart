import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pashusevak/services/apiServices.dart';

class AppointmentList extends StatefulWidget {
  final String sid;
  const AppointmentList({super.key, required this.sid});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Appointments"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: NetworkApiServices().getAppointmentList(widget.sid),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("No Appointments made"),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: Text("Data is being loaded...."));
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return Center(
                      child: Text("SID expired, Login again"),
                    );
                  }
              
                  List appointments = snapshot.data!;
              
                // Sort appointments by date in descending order
                appointments.sort((a, b) {
                  DateTime dateA = DateTime.parse(a.appointmentDate);
                  DateTime dateB = DateTime.parse(b.appointmentDate);
                  return dateB.compareTo(dateA); // For descending order
                });
              
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String appointmentDate = appointments[index].appointmentDate; 
                    DateTime date = DateTime.parse(appointmentDate);
              
                    // Format the date to compare with today's date
                    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
              
                    // Determine if we need to show the date header
                    bool showDateHeader = index == 0 ||
                        DateTime.parse(appointments[index - 1].appointmentDate).day != date.day;
              
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (showDateHeader)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                            child: Text(
                              formattedDate == todayDate ? "Today" : appointmentDate,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                              ),
                            ),
                          ),
                          Card(
                            elevation: 1.5,
                            child: ListTile(
                              contentPadding: EdgeInsets.all(16),
                              title: Text(
                                "Patient Name: ${appointments[index].patientName}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Status: ${appointments[index].status}",
                                    style: TextStyle(
                                      color:
                                          snapshot.data![index].status == "Open"
                                              ? Colors.green
                                              : Colors.red,
                                    ),
                                  ),
                                  Text(
                                    "Appointment booked with: ${appointments[index].practitionerName}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Appointment Time: ${appointments[index].appointmentTime}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
              SizedBox(height: 20),
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
