import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pashusevak/screens/traceAppointment.dart';

class CompletedAnyTask extends StatelessWidget {
  final String message;
  final String sid;
  final double? lat;
  final double? lon;
  const CompletedAnyTask({super.key, required this.message, required this.sid, this.lat, this.lon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Lottie.asset('assets/images/done.json')),
          Center(child: Text(message, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),)),
          SizedBox(
            height: 10,
          ),
          message == "Appointment Created" ? MaterialButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TraceAppointments(doctor_latitude: lat!, doctor_longitude: lon!,)));
          },
          child: Text("Track Your Appointments"),
          textColor: Colors.white,
          color: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          ) : Container()
        ],
      ),
    );
  }
}