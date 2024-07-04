import 'package:flutter/material.dart';

class CattleFarmHomePage extends StatefulWidget {
  const CattleFarmHomePage({super.key});

  @override
  State<CattleFarmHomePage> createState() => _CattleFarmHomePageState();
}

class _CattleFarmHomePageState extends State<CattleFarmHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffe924b),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.1),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xfffe924b),
                  ),
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: "Buy our Service",
                      ),
                      Tab(
                        text: "Sell your Service",
                      ),
                    ],
                  ),
                ),
                // TabBarView(children: [
                //   Center(child: Text("Buy our service")),
                //   Center(child: Text("sell our service")),
                // ])
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        children: [
          Tab(
            text: "Tab 1",
          ),
          Tab(
            text: "Tab 2",
          ),
        ],
      ),
    );
  }
}
