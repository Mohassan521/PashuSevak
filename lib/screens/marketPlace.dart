import 'package:flutter/material.dart';
import 'package:pashusevak/widgets/marketPlaceItems.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({super.key});

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  List animalDetails = [
    ["assets/images/cow1.png", "Breed Name . Vaccinated", "Rs.80,000"],
    ["assets/images/cow2.png", "Breed Name . Vaccinated", "Rs.80,000"],
    ["assets/images/cow1.png", "Breed Name . Vaccinated", "Rs.80,000"],
    ["assets/images/cow2.png", "Breed Name . Vaccinated", "Rs.80,000"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Marketplace",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {},
              color: Colors.orange,
              textColor: Colors.white,
              child: Text("List your Cattle"),
              minWidth: double.infinity,
              padding: EdgeInsets.all(14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "For you",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Gujrat, Ind",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: animalDetails.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.35),
                    itemBuilder: (context, index) {
                      return MarketPlaceItems(
                        image: animalDetails[index][0],
                        name: animalDetails[index][1],
                        price: animalDetails[index][2],
                        onTap: () {},
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
