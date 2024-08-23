import 'package:flutter/material.dart';

class SalesForDoctors extends StatelessWidget {
  const SalesForDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sales"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Sales graphs will be added here in future", style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800),))
          ],
        ),
      ),
    );
  }
}