import 'package:flutter/material.dart';

class PharmacyForFarmers extends StatefulWidget {
  const PharmacyForFarmers({super.key});

  @override
  State<PharmacyForFarmers> createState() => _PharmacyForFarmersState();
}

class _PharmacyForFarmersState extends State<PharmacyForFarmers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pharmacy For Farmers"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("Google Maps will be integrated in this screen"),
          )
        ],
      ),
    );
  }
}
