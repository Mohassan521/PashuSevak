import 'package:flutter/material.dart';

class SubscriptionForDoctors extends StatelessWidget {
  const SubscriptionForDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subscription For Doctors"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Subscription will be added here in future", style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800),))
          ],
        ),
      ),
    );
  }
}