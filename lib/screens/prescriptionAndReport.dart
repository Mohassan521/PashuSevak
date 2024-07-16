import 'package:flutter/material.dart';

class PrescriptionAndReport extends StatefulWidget {
  const PrescriptionAndReport({super.key});

  @override
  State<PrescriptionAndReport> createState() => _PrescriptionAndReportState();
}

class _PrescriptionAndReportState extends State<PrescriptionAndReport> {
  int selectedIndex = 0;

  void onSelectTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Prescription & Report"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Prescription",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Medicine",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "e.g Panadol",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.25,
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Add More +",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Ointments",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Ointment",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.25,
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Add More +",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dosage",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 44,
                            width: 43,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xfffe924b),
                                borderRadius: BorderRadius.circular(63)),
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("1 Tablet"),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 44,
                            width: 43,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xfffe924b),
                                borderRadius: BorderRadius.circular(63)),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Duration",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 44,
                            width: 43,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xfffe924b),
                                borderRadius: BorderRadius.circular(63)),
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("1 Week"),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 44,
                            width: 43,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xfffe924b),
                                borderRadius: BorderRadius.circular(63)),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Repeat",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => onSelectTab(0),
                      child: Container(
                        width: 128,
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedIndex == 0
                              ? Color(0xfffe924b)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Everyday',
                            style: TextStyle(
                              color: selectedIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onSelectTab(1),
                      child: Container(
                        width: 128,
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedIndex == 1
                              ? Color(0xfffe924b)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Alternative Days',
                            style: TextStyle(
                              color: selectedIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onSelectTab(2),
                      child: Container(
                        width: 128,
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedIndex == 2
                              ? Color(0xfffe924b)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Specific Date',
                            style: TextStyle(
                              color: selectedIndex == 2
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Time of the Day",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => onSelectTab(0),
                      child: Container(
                        width: 128,
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedIndex == 0
                              ? Color(0xfffe924b)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Morning',
                            style: TextStyle(
                              color: selectedIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onSelectTab(1),
                      child: Container(
                        width: 128,
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedIndex == 1
                              ? Color(0xfffe924b)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Noon',
                            style: TextStyle(
                              color: selectedIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onSelectTab(2),
                      child: Container(
                        width: 128,
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedIndex == 2
                              ? Color(0xfffe924b)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Evening',
                            style: TextStyle(
                              color: selectedIndex == 2
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "To be taken",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => onSelectTab(0),
                      child: Container(
                        width: 128,
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedIndex == 0
                              ? Color(0xfffe924b)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'After Food',
                            style: TextStyle(
                              color: selectedIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onSelectTab(1),
                      child: Container(
                        width: 128,
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedIndex == 1
                              ? Color(0xfffe924b)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Before Food',
                            style: TextStyle(
                              color: selectedIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onSelectTab(2),
                      child: Container(
                        width: 128,
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedIndex == 2
                              ? Color(0xfffe924b)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Evening',
                            style: TextStyle(
                              color: selectedIndex == 2
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              MaterialButton(
                padding: EdgeInsets.all(12.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Complete Order",
                      style: TextStyle(fontSize: 14),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                    )
                  ],
                ),
                color: Color(0xfffe924b),
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
