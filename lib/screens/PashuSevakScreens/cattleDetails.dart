import 'package:flutter/material.dart';

class CattleDetailsPashusevak extends StatefulWidget {
  const CattleDetailsPashusevak({super.key});

  @override
  State<CattleDetailsPashusevak> createState() =>
      _CattleDetailsPashusevakState();
}

class _CattleDetailsPashusevakState extends State<CattleDetailsPashusevak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cattle Details"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Types of Livestock (Required)",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.065,
                  padding: EdgeInsets.only(left: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.5),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: "Select your animal",
                    isExpanded: true,
                    items: [
                      DropdownMenuItem<String>(
                          value: 'Select your animal',
                          child: Text(
                            'Select your Animal',
                            style: TextStyle(fontSize: 16),
                          )),
                      DropdownMenuItem<String>(
                          value: 'Tiger',
                          child: Text(
                            'tiger',
                            style: TextStyle(fontSize: 16),
                          )),
                    ],
                    onChanged: (String? newValue) {},
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Total Number of Livestock",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "4",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.15),
                    ),
                  ),
                ),
              ],
            ),
            MaterialButton(
              minWidth: double.infinity,
              padding: EdgeInsets.all(12.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              onPressed: () {},
              child: Text(
                "Add Livestock Details",
                style: TextStyle(fontSize: 14),
              ),
              color: Color(0xfffe924b),
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
