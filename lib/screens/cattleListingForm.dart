import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pashusevak/models/cattleListModel.dart';
import 'package:pashusevak/models/getBreedOfCattle.dart';
import 'package:pashusevak/services/apiServices.dart';
import 'package:http/http.dart' as http;

class CattleListingForm extends StatefulWidget {
  final String? sid;
  const CattleListingForm({super.key, this.sid});

  @override
  State<CattleListingForm> createState() => _CattleListingFormState();
}

class _CattleListingFormState extends State<CattleListingForm> {
  Future<List<GetBreedOfCattle>> getBreedOfCattle() async {
    String url =
        "http://43.205.23.114/api/method/oymom.api.get_breed_of_cattle";

    var request = await http.get(Uri.parse(url), headers: {
      'Cookie': 'sid=${widget.sid}',
    });

    if (request.statusCode == 200) {
      List<dynamic> body = jsonDecode(request.body)['message'];
      List<GetBreedOfCattle> breeds =
          body.map((dynamic item) => GetBreedOfCattle.fromJson(item)).toList();
      return breeds;
    } else {
      throw Exception('Failed to load cattle breeds');
    }
  }

  File? _image;
  final _picker = ImagePicker();

  List<File> _selectedFiles = [];

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _selectedFiles.clear();
      _selectedFiles.add(_image!);
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  String productCategory = "";
  String? cattleType;
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
                    setState(() {
                      productCategory = newValue ?? productCategory;
                    });
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
              FutureBuilder(
                future: getBreedOfCattle(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No breeds available'));
                  } else if (snapshot.hasData) {
                    List<GetBreedOfCattle> breeds = snapshot.data!;

                    return Container(
                        height: MediaQuery.of(context).size.height * 0.055,
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
                            setState(() {
                              cattleType = newValue;
                            });
                          },
                          items: breeds.map((breed) {
                            return DropdownMenuItem<String>(
                              value: breed.value,
                              child: Center(
                                child: Text(
                                  breed.label,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            );
                          }).toList(),
                        ));
                  } else {
                    return Center(child: Text('No appointments available'));
                  }
                },
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
                    setState(() {
                      isOnHeat = newValue ?? isOnHeat;
                    });
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
                  value: heatPeriod,
                  onChanged: (String? newValue) {
                    setState(() {
                      heatPeriod = newValue ?? heatPeriod;
                    });
                  },
                  items: isOnHeat == "No"
                      ? [
                          DropdownMenuItem<String>(
                              value: '',
                              child: Center(
                                  child: Text(
                                '',
                                style: TextStyle(fontSize: 12),
                              ))),
                        ]
                      : [
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
                    setState(() {
                      isOnPregnant = newValue ?? isOnPregnant;
                    });
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
                    setState(() {
                      pregantPeriod = newValue ?? pregantPeriod;
                    });
                  },
                  items: isOnPregnant == "No"
                      ? [
                          DropdownMenuItem<String>(
                              value: '',
                              child: Center(
                                  child: Text(
                                '',
                                style: TextStyle(fontSize: 12),
                              ))),
                        ]
                      : [
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
              const Text(
                'Classified Attachments',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                    onPressed: (){
                      getImage();
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _selectedFiles.isNotEmpty
                      ? Column(
                          children: _selectedFiles.map((file) {
                            return Text("File uploaded");
                          }).toList(),
                        )
                      : Text('No files selected'),
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
                onPressed: () {
                  // final form = CattleListModel(
                  //   sellingProductCategory: productCategory,
                  //   typeOfCattle: cattleType!,
                  //   cattleBreed: cattleBreed.text,
                  //   age: double.tryParse(age.text) ?? 0.0,
                  //   noOfHeat: 0,
                  //   isOnHeat: isOnHeat,
                  //   heatPeriod: heatPeriod,
                  //   isOnPregnant: isOnPregnant,
                  //   pregnantPeriod: pregantPeriod,
                  //   nowMilkPerDay: double.tryParse(milkPerDay.text) ?? 0.0,
                  //   milkCapacityPerDay:
                  //       double.tryParse(milkCapacityPerDay.text) ?? 0.0,
                  //   classifiedAttachments: _selectedFiles,
                  // );

                  print("After submitting form, here are values: $productCategory, $cattleType, ${cattleBreed.text}, ${double.parse(age.text)},$isOnHeat, $heatPeriod, $isOnPregnant, $pregantPeriod, ${double.parse(milkPerDay.text)},${double.tryParse(milkCapacityPerDay.text) ?? 0.0}, $_selectedFiles");

                  NetworkApiServices().CattleListing(
                      productCategory,
                    cattleType!,
                    cattleBreed.text,
                    double.tryParse(age.text) ?? 0.0,
                    0,
                    isOnHeat,
                    heatPeriod,
                    isOnPregnant,
                    pregantPeriod,
                    double.tryParse(milkPerDay.text) ?? 0.0,
                    
                        double.tryParse(milkCapacityPerDay.text) ?? 0.0,
                    _selectedFiles,              
                      );
                },
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
