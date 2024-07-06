import 'package:flutter/material.dart';

class EmergencyAppointment extends StatelessWidget {
  const EmergencyAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Emergency Appointment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Breed",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Cow",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Age",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "1 Year",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Gender",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Male",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Health Status",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Bad Health",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Vaccination Report",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "PDF.",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Medical History",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Medical History",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Behaviour",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Behaviour",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Remarks",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Remarks",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color(0xfffe924b),
                textColor: Colors.white,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Reached ",
                      style: TextStyle(fontSize: 14),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7.5,
              ),
              MaterialButton(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xfffe924b),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                textColor: Color(0xfffe924b),
                onPressed: () {},
                child: Center(
                  child: Text(
                    "Get Direction",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
