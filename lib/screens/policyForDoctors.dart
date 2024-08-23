import 'package:flutter/material.dart';

class PolicyForDoctors extends StatelessWidget {
  const PolicyForDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms & Policies"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Terms & Policies", style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800),))
          ],
        ),
      ),
    );
  }
}