import 'package:flutter/material.dart';

class VetLabs extends StatefulWidget {
  const VetLabs({super.key});

  @override
  State<VetLabs> createState() => _VetLabsState();
}

class _VetLabsState extends State<VetLabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab Tests"),
        centerTitle: true,
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lab Test Required",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      Card(
                        elevation: 2,
                        child: ListTile(
                          leading:
                              Image.asset("assets/images/doctorAvatar.png"),
                          title: Text("Dr Kutkutiya Chenka"),
                          subtitle: Text("13 June, 2024"),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 12),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: ListTile(
                          leading:
                              Image.asset("assets/images/doctorAvatar.png"),
                          title: Text("Dr Kutkutiya Chenka"),
                          subtitle: Text("13 June, 2024"),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 12),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: ListTile(
                          leading:
                              Image.asset("assets/images/doctorAvatar.png"),
                          title: Text("Dr Kutkutiya Chenka"),
                          subtitle: Text("13 June, 2024"),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 12),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: ListTile(
                          leading:
                              Image.asset("assets/images/doctorAvatar.png"),
                          title: Text("Dr Kutkutiya Chenka"),
                          subtitle: Text("13 June, 2024"),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
