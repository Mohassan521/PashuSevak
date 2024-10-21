import 'package:flutter/material.dart';

class PharmacyForFarmers extends StatefulWidget {
  const PharmacyForFarmers({super.key});

  @override
  State<PharmacyForFarmers> createState() => _PharmacyForFarmersState();
}

class _PharmacyForFarmersState extends State<PharmacyForFarmers> {
  @override
  Widget build(BuildContext context) {
    print("We are Pakistanis");
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearest Pharmacies", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Where to buy Medicines", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),),
            Card(
              elevation: 1,
              
            
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(12),
                    title: Text("Nobamedika Pharmacy"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("101 Gujrat Street No.10"),
                        Row(
                          children: [
                            Text("8am - 10pm"),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text("Open", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
                          ],
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(12),
                    title: Text("Nobamedika Pharmacy"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("101 Gujrat Street No.10"),
                        Row(
                          children: [
                            Text("8am - 10pm"),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text("Closed", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
                          ],
                        )
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}