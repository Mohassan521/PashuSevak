import 'package:flutter/material.dart';
import 'package:pashusevak/screens/courseDetails.dart';
import 'package:pashusevak/widgets/courseCard.dart';

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
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Short courses for livelihood farmers",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15.5,
                          ),
                        ),
                        CourseCard(
                          image: "assets/images/course1.png",
                          discountDuration: "2 weeks",
                          title: "Introduction to Dairy Farmers",
                          detail1: "Basics of Dairy Farming",
                          detail2: "Introduction to dairy breeds",
                          detail3: "Basic dairy farm management practices",
                          detail4: "overview of milk production process",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CourseDetails(
                                        title: "Introduction to Dairy Farmers",
                                        subTitle: "Basics of Dairy Farming",
                                        subTitle2:
                                            "Introduction to dairy breeds",
                                        subTitle3:
                                            "Basic dairy farm management practices",
                                        subTitle4:
                                            "overview of milk production process")));
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CourseCard(
                          image: "assets/images/course1.png",
                          discountDuration: "1 Month course",
                          title: "Breeding & Genetics in Dairy Farming",
                          detail1: "Principles of Dairy Breeding",
                          detail2: "Genetic Improvement Techniques",
                          detail3: "AI in dairy farming",
                          detail4: "Selection of breeding stock",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CourseDetails(
                                        title:
                                            "Breeding & Genetics in Dairy Farming",
                                        subTitle:
                                            "Principles of Dairy Breeding",
                                        subTitle2:
                                            "Introduction to dairy breeds",
                                        subTitle3:
                                            "Basic dairy farm management practices",
                                        subTitle4:
                                            "overview of milk production process")));
                          },
                        ),
                      ],
                    ),
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
