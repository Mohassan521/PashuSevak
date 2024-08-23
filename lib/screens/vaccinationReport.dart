import 'package:flutter/material.dart';

class VaccinationReport extends StatefulWidget {
  const VaccinationReport({super.key});

  @override
  State<VaccinationReport> createState() => _VaccinationReportState();
}

class _VaccinationReportState extends State<VaccinationReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/report-image.png", width: MediaQuery.sizeOf(context).width * 0.70)),
          SizedBox(
            height: 10,
          ),
          Text("No Vaccination Reports Found", style: TextStyle(fontSize: 18),)
        ],
      ),
    );
  }
}