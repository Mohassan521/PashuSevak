import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pashusevak/Utils/localization.dart';

class DoctorsListForEmergencyCare extends StatefulWidget {
  const DoctorsListForEmergencyCare({super.key});

  @override
  State<DoctorsListForEmergencyCare> createState() =>
      _DoctorsListForEmergencyCareState();
}

class _DoctorsListForEmergencyCareState
    extends State<DoctorsListForEmergencyCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              Localization.of(context)!.translate('location') ?? "",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            Text(
              Localization.of(context)!.translate('gujarat_ind')!,
              style: TextStyle(fontSize: 16, color: Colors.black),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/DoctorPic.png'), // Replace with your asset
                  radius: 40,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Kutkutiya Chenak',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('12yr - Experience'),
                    Text('125 - Consultations'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Available on   ', style: TextStyle(color: Colors.grey)),
                    Text('5 days a week', style: TextStyle(fontWeight: FontWeight.bold)),
                    
                  ],
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
