import 'package:flutter/material.dart';

class LivelihoodHistoryForDoctors extends StatelessWidget {
  const LivelihoodHistoryForDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Livelihood History"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Livelihood History will be displayed in future", style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800),))
          ],
        ),
      ),
    );
  }
}