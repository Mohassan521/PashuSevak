import 'package:flutter/material.dart';

class PharmacyForDoctors extends StatefulWidget {
  const PharmacyForDoctors({super.key});

  @override
  State<PharmacyForDoctors> createState() => _PharmacyForDoctorsState();
}

class _PharmacyForDoctorsState extends State<PharmacyForDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pharmacy For Doctors"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Doctor's Inventory will be managed here in future", style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800),))
          ],
        ),
      ),
    );
  }
}