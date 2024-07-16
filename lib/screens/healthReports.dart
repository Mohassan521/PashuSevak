import 'package:flutter/material.dart';
import 'package:pashusevak/Utils/localization.dart';

class HealthReportsPage extends StatefulWidget {
  const HealthReportsPage({super.key});

  @override
  State<HealthReportsPage> createState() => _HealthReportsPageState();
}

class _HealthReportsPageState extends State<HealthReportsPage> {
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
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined))
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
                labelColor: Colors.orange,
                indicatorColor: Colors.orange,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: "Cattle 1",
                  ),
                  Tab(
                    text: "Cattle 2",
                  ),
                  Tab(
                    text: "Cattle 3",
                  ),
                  Tab(
                    text: "Cattle 4",
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                Column(
                  children: [
                    Card(
                      elevation: 2.0,
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                "assets/images/healthReport1.png",
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 180.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hepatitis - A",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      "4 July, 2024",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Text("Hepatitis - A",
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      elevation: 2.0,
                      margin: EdgeInsets.all(16.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/images/healthReport1.png",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 180.0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hepatitis - A",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        "4 July, 2024",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Text("Hepatitis - A",
                                      style: TextStyle(fontSize: 18)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Center(child: Text("Cattle 2")),
                Center(child: Text("Cattle 3")),
                Center(child: Text("Cattle 4")),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
