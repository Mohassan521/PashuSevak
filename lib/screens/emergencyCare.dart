import 'package:flutter/material.dart';

class EmergencyCare extends StatefulWidget {
  const EmergencyCare({super.key});

  @override
  State<EmergencyCare> createState() => _EmergencyCareState();
}

class _EmergencyCareState extends State<EmergencyCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nobamedika Pharmacy"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 3,
            ),
            child: Column(
              children: [
                Text("Deliver in"),
                Text(
                  "60 minutes",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12,
        ),
        child: Column(
          children: [
            Container(
                child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                hintText: 'Search here',
              ),
            )),
          ],
        ),
      ),
    );
  }
}
