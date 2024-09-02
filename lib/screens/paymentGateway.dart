import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pashusevak/Utils/utils.dart';
import 'package:pashusevak/services/apiServices.dart';
import 'package:pashusevak/widgets/completed.dart';

class PaymentGateway extends StatelessWidget {
  final String sid;
  final String doctorId;
  final DateTime selectedDate;
  final String doctorName;
  final String service_unit;
  final double visitFees;
  final String appt_time;
  final String farmer_email;
  const PaymentGateway({super.key, required this.doctorName, required this.service_unit, required this.visitFees, required this.appt_time, required this.farmer_email, required this.doctorId, required this.selectedDate, required this.sid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment Confirmation"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Farmer Email: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                Text(farmer_email, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Doctor Name: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                Text(doctorName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Service Unit of Doctor: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                Text(service_unit, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Visit Fees of Doctor: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                Text(visitFees.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Appointment Time: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                Text(appt_time, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
              ],
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.orange,
                  child: Text(
                    "Confirm Appointment",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
                    NetworkApiServices().createAppointment(doctorId, formattedDate, farmer_email, service_unit, appt_time, sid).then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CompletedAnyTask(message: "Appointment Created", sid: sid,)));
                    });
                    print("After appointment creation: $doctorId, $selectedDate, $farmer_email, $service_unit, $appt_time");
                  },
                )
          ],
        ),
      ),
    );
  }
}