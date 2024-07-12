import 'package:flutter/material.dart';
import 'package:pashusevak/widgets/liveStockDetailsTab1.dart';
import 'package:pashusevak/widgets/liveStockDetailsTab2.dart';
import 'package:pashusevak/widgets/liveStockDetailsTab3.dart';
import 'package:pashusevak/widgets/liveStockDetailsTab4.dart';

class LiveStickDetails extends StatefulWidget {
  const LiveStickDetails({super.key});

  @override
  State<LiveStickDetails> createState() => _LiveStickDetailsState();
}

class _LiveStickDetailsState extends State<LiveStickDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Livestock Details"),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.sizeOf(context).height * 0.08),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Color(0xfffe924b),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  indicatorWeight: MediaQuery.sizeOf(context).height * 0.01,
                  unselectedLabelColor: Colors.grey.shade300,
                  // labelPadding: EdgeInsets.symmetric(
                  //     horizontal: 16.0), // Space between tabs
                  // indicatorPadding: EdgeInsets.symmetric(vertical: 20),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  tabs: [
                    Tab(text: ''),
                    Tab(text: ''),
                    Tab(text: ''),
                    Tab(text: ''),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              LiveStockDetailsTab1(),
              LiveStockDetailsTab2(),
              LiveStockDetailsTab3(),
              LiveStockDetailsTab4(),
            ],
          ),
        ));
  }
}
