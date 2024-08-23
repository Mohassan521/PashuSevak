import 'package:flutter/material.dart';
import 'package:pashusevak/models/loggedUserModel.dart';
import 'package:pashusevak/provider/provider.dart';
import 'package:pashusevak/screens/paymentGateway.dart';
import 'package:pashusevak/services/apiServices.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentPage extends StatefulWidget {
  final String doctor_id;
  final String sid;
  final String doctor_name;
  final double visit_fees;
  const AppointmentPage(
      {super.key, required this.doctor_id, required this.sid, required this.doctor_name, required this.visit_fees});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

  // DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: Provider.of<DateProvider>(context, listen: false).selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null )
      setState(() {
        Provider.of<DateProvider>(context, listen: false).updateDate(pickedDate);
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dr. ${widget.doctor_name}appointment slots"),
        
      ),
      floatingActionButton:  FloatingActionButton(onPressed: (){
            _selectDate(context);
          },
          child: Icon(Icons.calendar_month_rounded),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Slot Name: Regular",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
          ),
          
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.75,
                child: FutureBuilder(
                  future: NetworkApiServices()
                      .fetchHealthcareSchedule(widget.doctor_id, widget.sid, Provider.of<DateProvider>(context).selectedDate ?? DateTime.now()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.availSlot.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                          title: Text("Day: ${snapshot.data!.availSlot[index].day}"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("From Time: ${snapshot.data!.availSlot[index].fromTime}"),
                              Text("From Time: ${snapshot.data!.availSlot[index].toTime}"),
                            ],
                          ),
                          trailing: MaterialButton(
                            onPressed: () async {

                              LoggedUserModel userDetails = await NetworkApiServices().getUserDetails(widget.sid);

                              print("User Email of this user: : ${userDetails.name}");

                              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentGateway(
                                sid: widget.sid,
                                doctorId: widget.doctor_id,
                                selectedDate: Provider.of<DateProvider>(context).selectedDate ?? DateTime.now(),
                                doctorName: widget.doctor_name, service_unit: snapshot.data!.serviceUnit, visitFees: widget.visit_fees , appt_time: "${snapshot.data!.availSlot[index].fromTime}", farmer_email: userDetails.name ?? "")));


                            },
                            child: Text("Book Appointment"),
                            color: Colors.orange,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                          ),
                        );
                        
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
