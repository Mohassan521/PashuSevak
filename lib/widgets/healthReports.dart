import 'package:flutter/material.dart';

class HealthReports extends StatelessWidget {
  const HealthReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffFFF5EE),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("July 4,2024"),
            Text("Hepatitis - A"),
            Row(
              children: [
                Image.asset("assets/images/petshop.png"),
                SizedBox(
                  width: 15,
                ),
                Text("Cattle Name")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  textColor: Colors.white,
                  color: Color(0xfffe924b),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_circle_down,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 6.5,
                      ),
                      Text("Download Report"),
                    ],
                  ),
                ),
                MaterialButton(
                  textColor: Colors.white,
                  color: Color(0xfffe924b),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_circle_down,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 6.5,
                      ),
                      Text("View Report"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
