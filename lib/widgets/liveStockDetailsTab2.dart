import 'package:flutter/material.dart';

class LiveStockDetailsTab2 extends StatelessWidget {
  const LiveStockDetailsTab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name of Breed (Required)",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Name of Animal",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.25,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Age (Required)",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Age of animal",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.25,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Gender (Required)",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "gender of animal",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.25,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Health Status (Required)",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Health Status",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.25,
                    ),
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
              "Save & Continue",
              style: TextStyle(fontSize: 14),
            ),
            color: Color(0xfffe924b),
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
