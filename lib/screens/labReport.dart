import 'package:flutter/material.dart';

class LabReportScreen extends StatefulWidget {
  const LabReportScreen({super.key});

  @override
  State<LabReportScreen> createState() => _LabReportScreenState();
}

class _LabReportScreenState extends State<LabReportScreen> {
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
          Text("No Lab Reports Found", style: TextStyle(fontSize: 18),)
        ],
      ),
    );
  }
}