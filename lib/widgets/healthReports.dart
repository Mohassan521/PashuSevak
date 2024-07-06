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
            Text(
              "July 4,2024",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 2.5,
            ),
            Text(
              "Hepatitis - A",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xffFE924B),
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 2.5,
            ),
            Row(
              children: [
                Image.asset("assets/images/petshop.png"),
                SizedBox(
                  width: 9,
                ),
                Text(
                  "Cattle Name",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  textColor: Colors.white,
                  color: Color(0xfffe924b),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.visibility,
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
