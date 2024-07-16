import 'package:flutter/material.dart';

class TrainingFacility extends StatefulWidget {
  const TrainingFacility({super.key});

  @override
  State<TrainingFacility> createState() => _TrainingFacilityState();
}

class _TrainingFacilityState extends State<TrainingFacility> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Training Program"),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.orange,
              tabs: [
                Tab(
                  text: "Free Courses",
                ),
                Tab(
                  text: "Paid Courses",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Short courses for livelihood farmers",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15.5,
                        ),
                      )
                    ],
                  ),
                ),
                Center(child: Text("2")),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
