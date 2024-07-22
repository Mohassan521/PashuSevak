import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CattleListingForm extends StatefulWidget {
  const CattleListingForm({super.key});

  @override
  State<CattleListingForm> createState() => _CattleListingFormState();
}

class _CattleListingFormState extends State<CattleListingForm> {
  String productCategory = "";
  String cattleType = "";
  TextEditingController cattleBreed = TextEditingController();
  TextEditingController age = TextEditingController();
  String isOnHeat = "";
  String heatPeriod = "";
  String isOnPregnant = "";
  String pregantPeriod = "";
  TextEditingController milkPerDay = TextEditingController();
  TextEditingController milkCapacityPerDay = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Your Cattle"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Selling Product Category"),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.055,
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
                  alignment: Alignment.center,
                  isExpanded: true,
                  value: productCategory,
                  onChanged: (String? newValue) {
                    // setState(() {
                    //   entranceDoorValue = newValue ?? entranceDoorValue;
                    // });
                  },
                  items: [
                    DropdownMenuItem<String>(
                        value: '',
                        child: Center(
                            child: Text(
                          'Select your Product Category',
                          style: TextStyle(fontSize: 12),
                        ))),
                    DropdownMenuItem<String>(
                        value: 'Cattel',
                        child: Center(
                            child: Text(
                          'Cattle',
                          style: TextStyle(fontSize: 12),
                        ))),
                    DropdownMenuItem<String>(
                        value: 'By products',
                        child: Center(
                            child: Text('By Products',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: 'Bulk Milk',
                        child: Center(
                            child: Text('Bulk Milk',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: 'Bulk Vegetables',
                        child: Center(
                            child: Text('Bulk Vegetables',
                                style: TextStyle(fontSize: 12)))),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Type of Cattle"),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.055,
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
                  alignment: Alignment.center,
                  isExpanded: true,
                  value: cattleType,
                  onChanged: (String? newValue) {
                    // setState(() {
                    //   entranceDoorValue = newValue ?? entranceDoorValue;
                    // });
                  },
                  items: [
                    DropdownMenuItem<String>(
                        value: '',
                        child: Center(
                            child: Text(
                          'Select your Cattle',
                          style: TextStyle(fontSize: 12),
                        ))),
                    DropdownMenuItem<String>(
                        value: 'Cattel 1',
                        child: Center(
                            child: Text(
                          'Cattle 1',
                          style: TextStyle(fontSize: 12),
                        ))),
                    DropdownMenuItem<String>(
                        value: 'Cattle 2',
                        child: Center(
                            child: Text('Cattle 2',
                                style: TextStyle(fontSize: 12)))),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Cattle Breed"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: cattleBreed,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.5),
                      borderSide: BorderSide(color: Colors.black, width: 1.1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.5),
                      borderSide: BorderSide(color: Colors.black, width: 1.1)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Age"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: age,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.5),
                      borderSide: BorderSide(color: Colors.black, width: 1.1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.5),
                      borderSide: BorderSide(color: Colors.black, width: 1.1)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Is On Heat"),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.055,
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
                  alignment: Alignment.center,
                  isExpanded: true,
                  value: isOnHeat,
                  onChanged: (String? newValue) {
                    // setState(() {
                    //   entranceDoorValue = newValue ?? entranceDoorValue;
                    // });
                  },
                  items: [
                    DropdownMenuItem<String>(
                        value: '',
                        child: Center(
                            child: Text(
                          '',
                          style: TextStyle(fontSize: 12),
                        ))),
                    DropdownMenuItem<String>(
                        value: 'Yes',
                        child: Center(
                            child: Text(
                          'Yes',
                          style: TextStyle(fontSize: 12),
                        ))),
                    DropdownMenuItem<String>(
                        value: 'No',
                        child: Center(
                            child: Text('No', style: TextStyle(fontSize: 12)))),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Heat Period"),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.055,
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
                  alignment: Alignment.center,
                  isExpanded: true,
                  value: cattleType,
                  onChanged: (String? newValue) {
                    // setState(() {
                    //   entranceDoorValue = newValue ?? entranceDoorValue;
                    // });
                  },
                  items: [
                    DropdownMenuItem<String>(
                        value: '',
                        child: Center(
                            child: Text(
                          '',
                          style: TextStyle(fontSize: 12),
                        ))),
                    DropdownMenuItem<String>(
                        value: '1 week',
                        child: Center(
                            child: Text(
                          '1 week',
                          style: TextStyle(fontSize: 12),
                        ))),
                    DropdownMenuItem<String>(
                        value: '2 week',
                        child: Center(
                            child: Text('2 week',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '3 week',
                        child: Center(
                            child: Text('2 week',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '1 month',
                        child: Center(
                            child: Text('1 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '2 month',
                        child: Center(
                            child: Text('2 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '3 month',
                        child: Center(
                            child: Text('3 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '4 month',
                        child: Center(
                            child: Text('4 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '5 month',
                        child: Center(
                            child: Text('5 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '6 month',
                        child: Center(
                            child: Text('6 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '1 year before',
                        child: Center(
                            child: Text('1 year before',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '1.5 year before',
                        child: Center(
                            child: Text('1.5 year before',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: 'more than 2 years',
                        child: Center(
                            child: Text('more than 2 years',
                                style: TextStyle(fontSize: 12)))),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Is On Pregnant"),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.055,
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
                  alignment: Alignment.center,
                  isExpanded: true,
                  value: isOnPregnant,
                  onChanged: (String? newValue) {
                    // setState(() {
                    //   entranceDoorValue = newValue ?? entranceDoorValue;
                    // });
                  },
                  items: [
                    DropdownMenuItem<String>(
                        value: '',
                        child: Center(
                            child: Text(
                          '',
                          style: TextStyle(fontSize: 12),
                        ))),
                    DropdownMenuItem<String>(
                        value: 'Yes',
                        child: Center(
                            child: Text(
                          'Yes',
                          style: TextStyle(fontSize: 12),
                        ))),
                    DropdownMenuItem<String>(
                        value: 'No',
                        child: Center(
                            child: Text('No', style: TextStyle(fontSize: 12)))),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Pregnant Period"),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.055,
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
                  alignment: Alignment.center,
                  isExpanded: true,
                  value: pregantPeriod,
                  onChanged: (String? newValue) {
                    // setState(() {
                    //   entranceDoorValue = newValue ?? entranceDoorValue;
                    // });
                  },
                  items: [
                    DropdownMenuItem<String>(
                        value: '',
                        child: Center(
                            child: Text(
                          '',
                          style: TextStyle(fontSize: 12),
                        ))),
                    DropdownMenuItem<String>(
                        value: '1 month',
                        child: Center(
                            child: Text('1 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '2 month',
                        child: Center(
                            child: Text('2 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '3 month',
                        child: Center(
                            child: Text('3 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '4 month',
                        child: Center(
                            child: Text('4 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '5 month',
                        child: Center(
                            child: Text('5 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '6 month',
                        child: Center(
                            child: Text('6 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '7 month',
                        child: Center(
                            child: Text('7 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '8 month',
                        child: Center(
                            child: Text('8 month',
                                style: TextStyle(fontSize: 12)))),
                    DropdownMenuItem<String>(
                        value: '9 month',
                        child: Center(
                            child: Text('9 month',
                                style: TextStyle(fontSize: 12)))),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Milk Per Day"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: milkPerDay,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.5),
                      borderSide: BorderSide(color: Colors.black, width: 1.1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.5),
                      borderSide: BorderSide(color: Colors.black, width: 1.1)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Milk Capacity Per Day"),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: milkCapacityPerDay,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                  labelStyle: TextStyle(color: Color(0xff941420), fontSize: 13),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.5),
                      borderSide: BorderSide(color: Colors.black, width: 1.1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.5),
                      borderSide: BorderSide(color: Colors.black, width: 1.1)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Classified Attachments',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  // SizedBox(
                  //   width: 28,
                  // ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.orange,
                      ),
                    ),
                    icon: Icon(
                      Icons.cloud_upload_outlined,
                      size: 19,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Browse',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // getImage();
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  // Text(
                  //   _image != null && _image!.path.isNotEmpty
                  //       ? "File Uploaded"
                  //       : "",
                  // ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              MaterialButton(
                onPressed: () {},
                child: Center(child: Text("Submit")),
                minWidth: double.infinity,
                color: Colors.orange,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
